package kr.or.hostel.model.service;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.hostel.model.dao.HostelDao;
import kr.or.hostel.model.vo.Hostel;
import kr.or.hostel.model.vo.HostelFile;
import kr.or.hostel.model.vo.HostelOption;
import kr.or.hostel.model.vo.ReservableRoom;
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
				//여기까지 옵션인서트완료 
				
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
					//캘린더 객체 사용시 순서 주의! eday를 sday밑으로 넣을경우 밑에 while문에서 +1에서 사용되는 cal객체에 eday가 들어감 
					cal.set(eYear, eMon-1, eDate);
					String eDay = sdf.format(cal.getTime());
					cal.set(sYear, sMon-1, sDate);
					String sDay = sdf.format(cal.getTime());
					
					System.out.println("데이트 포맷-시작일:" + sDay + "종료일" + eDay);
					
					ArrayList<String> date = new ArrayList<String>();
					
					while(!sDay.equals(eDay)) {
						date.add(sDay);
						cal.add(Calendar.DATE, 1);
						sDay = sdf.format(cal.getTime());
						//System.out.println("s"+sDay);
					}
									
					date.add(eDay); // 검색/예약할땐 eday넣을지말지 주의 
					System.out.println("예약가능일:"+date);
//					System.out.println("날짜 length"+date.size());
					int dateResult = 0;
					for(String rv : date) {
						ReservableRoom rvr = new ReservableRoom();
						rvr.setOptionNo(lastOptionNum);
						rvr.setReservableDate(rv);
						System.out.println("리스트 포문테스트:"+rv);
						dateResult = dao.insertHostelDate(rvr);
					}//예약가능일자 인서트 종료 
					if(dateResult>0) {
						System.out.println("날짜 전건 인서트 완료");
						result = Hostelresult*optionResult*dateResult;
					}else {
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
		}//호스텔인서트결과>0 
		System.out.println("서비스에서 컨트롤러로 되돌아가는값:" + result);
		return result;
	}

}
