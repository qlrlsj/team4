package kr.or.hostel.model.service;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.hostel.model.dao.HostelDao;
import kr.or.hostel.model.vo.Hostel;
import kr.or.hostel.model.vo.HostelDetailList;
import kr.or.hostel.model.vo.HostelFile;
import kr.or.hostel.model.vo.HostelOption;
import kr.or.hostel.model.vo.HostelReserve;
import kr.or.hostel.model.vo.ReservableRoom;
import kr.or.hostel.model.vo.ReservedRoom;
import kr.or.member.model.vo.Member;

@Service
@Transactional
public class HostelService {

	@Autowired
	private HostelDao dao;

	public int insertHostel(Hostel h, ArrayList<HostelFile> fileList, String[] roomOptions, String[] hostelPrices,
			String[] standardBooknums, String[] maxBooknums, String[] roomNames) {

		// 1. 호스텔 기본정보 인서트 (db에 넣을때 dateType주의
		int Hostelresult = dao.insertHostel(h);

		// 2. 파일 인서트
		int result = 0; // 되돌려줄값 아래 처리에 따라 다르게 반영전 선언
		if (Hostelresult > 0) {
			// 호텔기본정보 인서트 성공시 파일 등록 + 옵션등록
			System.out.println("호스텔 기본정보 인서트 성공");

			int hc = dao.selectHostelCode();
			for (HostelFile file : fileList) {
				file.setHostelCode(hc);
				System.out.println("인서트 후 호스텔 코드 : " + hc);
//				file.setHostelCode(h.getHostelCode()); 
				result += dao.insertFile(file);
			}
			// 옵션 리스트 length만큼 insert
			for (int i = 0; i < roomOptions.length; i++) {
				HostelOption ho = new HostelOption();
				ho.setHostelCode(hc);
				ho.setRoomOption(roomOptions[i]);
				ho.setHostelPrice(Integer.parseInt(hostelPrices[i]));
				ho.setMaxBooknum(Integer.parseInt(maxBooknums[i]));
				ho.setStandardBooknum(Integer.parseInt(standardBooknums[i]));
				ho.setRoomName(roomNames[i]);

				int optionResult = dao.insertOption(ho);
				// 여기까지 옵션인서트완료

				int lastOptionNum = dao.selectOptionNum();// 가장 최근 옵션넘버 가져오기
				if (optionResult > 0) { // 옵션하나 인서트 성공하면 예약가능일자를 옵션넘버에맞춰 전부 인서트
					String startDate = h.getBookStart();
					String endDate = h.getBookEnd();

					System.out.println("예약시작일:" + startDate + "/종료일:" + endDate);
					int sYear = Integer.parseInt(startDate.split("-")[0]);
					int sMon = Integer.parseInt(startDate.split("-")[1]);
					int sDate = Integer.parseInt(startDate.split("-")[2]);
					int eYear = Integer.parseInt(endDate.split("-")[0]);
					int eMon = Integer.parseInt(endDate.split("-")[1]);
					int eDate = Integer.parseInt(endDate.split("-")[2]);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					Calendar cal = Calendar.getInstance();
					// 캘린더 객체 사용시 순서 주의! eday를 sday밑으로 넣을경우 밑에 while문에서 +1에서 사용되는 cal객체에 eday가 들어감
					cal.set(eYear, eMon - 1, eDate);
					String eDay = sdf.format(cal.getTime());
					cal.set(sYear, sMon - 1, sDate);
					String sDay = sdf.format(cal.getTime());

					System.out.println("데이트 포맷-시작일:" + sDay + "종료일" + eDay);

					ArrayList<String> date = new ArrayList<String>();

					while (!sDay.equals(eDay)) {
						date.add(sDay);
						cal.add(Calendar.DATE, 1);
						sDay = sdf.format(cal.getTime());
						// System.out.println("s"+sDay);
					}

					date.add(eDay); // 검색/예약할땐 eday넣을지말지 주의
					System.out.println("예약가능일:" + date);
//					System.out.println("날짜 length"+date.size());
					int dateResult = 0;
					for (String rv : date) {
						ReservableRoom rvr = new ReservableRoom();
						rvr.setOptionNo(lastOptionNum);
						rvr.setReservableDate(rv);
						System.out.println("리스트 포문테스트:" + rv);
						dateResult = dao.insertHostelDate(rvr);
					} // 예약가능일자 인서트 종료
					if (dateResult > 0) {
						System.out.println("날짜 전건 인서트 완료");
						result = Hostelresult * optionResult * dateResult;
					} else {
						System.out.println("날짜 인서트 실패 ");
						return dateResult;
					}

				} else {
					System.out.println("옵션인서트 실패 ");
					result = -2;
				}
			} // 옵션리스트 인서트 포문 종료

		} else {
			// 인서트 실패시
			System.out.println("호스텔 기본 인서트 실패 ");
			result = -1;
		} // 호스텔인서트결과>0
		System.out.println("서비스에서 컨트롤러로 되돌아가는값:" + result);
		return result;
	}

	public ArrayList<Hostel> searchHostelList(int roomType, String searchKeyword, String startDate, String endDate,
			int customerNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("roomType", roomType);
		map.put("searchKeyword", searchKeyword);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("customerNum", customerNum);
		ArrayList<Hostel> list = dao.searchHostelList(map);
		// System.out.println("List 출력전"+list.indexOf(0));
		return list;
	}

	public HostelDetailList hostelDetail(int hostelCode, String startDate, String endDate) {

		Hostel hostel = dao.hostelDetail(hostelCode); // 호스텔 기본정보

		HashMap<String, Object> optionMap = new HashMap<String, Object>(); // 예약가능한 날짜가 있는 옵션 가져오기
		optionMap.put("startDate", startDate);
		optionMap.put("endDate", endDate);
		optionMap.put("hostelCode", hostelCode);
		ArrayList<HostelOption> optionList = dao.detailOptionList(optionMap);
		// System.out.println("옵션리스트:"+optionList.get(0));

		// 파일
		ArrayList<HostelFile> fileList = dao.searchHostelFile(hostelCode);
	//	System.out.println("서비스hostel값 : " + hostel);
		HostelDetailList hdl = new HostelDetailList(hostel, optionList, fileList);

		return hdl;
	}

	public ArrayList<HostelOption> searchHostelOptionList(int hostelCode, String startDate, String endDate,
			int customerNum) {
		HashMap<String, Object> optionMap = new HashMap<String, Object>(); // 예약가능한 날짜가 있는 옵션 가져오기
		optionMap.put("startDate", startDate);
		optionMap.put("endDate", endDate);
		optionMap.put("hostelCode", hostelCode);
		optionMap.put("customerNum", customerNum);
		ArrayList<HostelOption> optionList = dao.detailOptionList(optionMap);

		return optionList;
	}

	public HostelOption searchSelectedHostel(int optionNo) {
		HostelOption hostel = dao.searchSelectedHostel(optionNo);
		return hostel;
	}

	public HostelReserve reserveHostel(int payPrice, HostelReserve hr) {
		// 결제테이블(결제금액) , 예약테이블(optionNo memberNo..), 예약된방테이블 세개 인서트 필요
		// 결제테이블 - 결제금액
		// 예약테이블 - 옵션번호, 회원번호, 주문자이름, 이메일, 번호, 인원, 입실일 ,퇴실일
		// 예약테이블까지 인서트 끝나면 reserved room 인서트까지 !

		// 마지막 날짜 삽입
		int totalResult = 0;
		String recentRvNo = ""; // 예약화면에 보내줄정보 끌어올 변수 

		int payresult = dao.insertHostelPay(payPrice);
		if (payresult > 0) {// 결제 성공하여 결제테이블 인서트 완료시
			// 예약테이블 인서트 시작
			int repayNo = dao.selectPayNo();
			HashMap<String, Object> reserveMap = new HashMap<String, Object>();
			reserveMap.put("payNo", repayNo);
			reserveMap.put("optionNo", hr.getOptionNo());
			reserveMap.put("memberNo", hr.getMemberNo());
			reserveMap.put("reserveName", hr.getReserveName());
			reserveMap.put("reserveEmail", hr.getReserveEmail());
			reserveMap.put("reservePhone", hr.getReservePhone());
			reserveMap.put("reserveNum", hr.getReserveNum());
			reserveMap.put("hostelIndate", hr.getHostelIndate());
			reserveMap.put("hostelOutdate", hr.getHostelOutdate());
			int rh = dao.insertHostelReserve(reserveMap);
			System.out.println("입실일" + hr.getHostelIndate());
			if (rh > 0) { // 예약완료까지 인서트하면 예약된일자 인서트 시작
				// 옵션하나 인서트 성공하면 예약가능일자를 옵션넘버에맞춰 전부 인서트
				String startDate = hr.getHostelIndate();
				String endDate = hr.getHostelOutdate();

				//System.out.println("예약시작일:" + startDate + "/종료일:" + endDate);
				int sYear = Integer.parseInt(startDate.split("-")[0]);
				int sMon = Integer.parseInt(startDate.split("-")[1]);
				int sDate = Integer.parseInt(startDate.split("-")[2]);
				int eYear = Integer.parseInt(endDate.split("-")[0]);
				int eMon = Integer.parseInt(endDate.split("-")[1]);
				int eDate = Integer.parseInt(endDate.split("-")[2]);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Calendar cal = Calendar.getInstance();
				// 캘린더 객체 사용시 순서 주의! eday를 sday밑으로 넣을경우 밑에 while문에서 +1에서 사용되는 cal객체에 eday가 들어감
				cal.set(eYear, eMon - 1, eDate);
				String eDay = sdf.format(cal.getTime());
				cal.set(sYear, sMon - 1, sDate);
				String sDay = sdf.format(cal.getTime());

				//System.out.println("데이트 포맷-시작일:" + sDay + "종료일" + eDay);

				ArrayList<String> date = new ArrayList<String>();

				while (!sDay.equals(eDay)) {
					date.add(sDay);
					cal.add(Calendar.DATE, 1);
					sDay = sdf.format(cal.getTime());
					// System.out.println("s"+sDay);
				}

				// date.add(eDay); // 검색/예약할땐 eday넣을지말지 주의 여기선 퇴실일 제외
				//System.out.println("예약가능일:" + date);
//				System.out.println("날짜 length"+date.size());
				int dateResult = 0;
				String reservationNo = dao.selectReservationNo(); // 가장최근 예약번호 
				recentRvNo = reservationNo;
				for (String rv : date) {
					ReservedRoom rdr = new ReservedRoom();
					rdr.setOptionNo(hr.getOptionNo());
					rdr.setMemberNo(hr.getMemberNo()); // 비회원이면 세팅다시해야....
					rdr.setReservedDate(rv);
					rdr.setReservationNo(reservationNo);

				//	System.out.println("리스트 포문테스트:" + rv);
					dateResult = dao.insertReservedRoom(rdr);
					dateResult++;
				} // 예약가능일자 인서트 종료
				if (dateResult > 0) {
					System.out.println("예약일자 insert완료!");
					totalResult = 1;
				} else {
					System.out.println("날짜 인서트 실패 ");
					return null;
				}

			} else {
				return null;
			}

		} else {
			return null;
		} // 예약관련 insert완료
		// 예약 완료 화면에 띄워줄 정보 조회 
		HostelReserve hrInfo = dao.selectHostelReserve(recentRvNo);

		return hrInfo;
	}



	public ArrayList<Hostel> filterHostelList(String checkedComfortList, String checkedServiceList, String keyWord,
			String startDate, String endDate, int roomType, int customerNum, int filterIidx) {
		 
		 HashMap<String, Object> map = new HashMap<String, Object>();
		 map.put("checkedComfortList",checkedComfortList);
		 map.put("checkedServiceList",checkedServiceList);
		 map.put("searchKeyword",keyWord);
		 map.put("startDate",startDate);
		 map.put("endDate",endDate);
		 map.put("roomType",roomType);
		 map.put("customerNum",customerNum);
		 map.put("filterIidx",filterIidx);
		 
		 ArrayList<Hostel> list = dao.filterHostelList(map);

		return list;
	}

}
