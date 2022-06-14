package kr.or.hostel.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.hostel.model.vo.Hostel;
import kr.or.hostel.model.vo.HostelFile;
import kr.or.hostel.model.vo.HostelOption;
import kr.or.hostel.model.vo.HostelReserve;
import kr.or.hostel.model.vo.ReservableRoom;
import kr.or.hostel.model.vo.ReservedRoom;
import kr.or.member.model.vo.Member;

@Repository
public class HostelDao {
	@Autowired
	private SqlSessionTemplate sqlSession; //마이바티스 쿼리용 

	public int insertHostel(Hostel h) {
		int result = sqlSession.insert("hostel.insertHostel",h);
		return result;
	}

	public int insertFile(HostelFile file) {
		int result = sqlSession.insert("hostel.insertFile",file);
		return result;
	}

	public int selectHostelCode() {
		int result = sqlSession.selectOne("hostel.hostelCode");
		return result;
	}

	public int insertOption(HostelOption ho) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("hostel.insertOption",ho);
		return result;
	}

	public int selectOptionNum() {
		int result = sqlSession.selectOne("hostel.selectOptionNum");
		return result;
	}

	public int insertHostelDate(ReservableRoom rvr) {
		int result = sqlSession.insert("hostel.insertHostelDate",rvr);
		return result;
	}


	public ArrayList<Hostel> searchHostelList(HashMap<String, Object> map) {
		//System.out.println("dao직전"+map);
		List list = sqlSession.selectList("hostel.searchHostelListMain",map);
		//System.out.println("mapper완료");
		//System.out.println("mapper처리 후 "+list.get(0));
		return (ArrayList<Hostel>)list;
	}

	public Hostel hostelDetail(int hostelCode) {
		Hostel hostel = sqlSession.selectOne("hostel.selectHostelDetail",hostelCode);
//		List ho = sqlSession.selectList("hostel.selectOptionList",hostelCode);
//		//ArrayList<HostelOption>
				
		// 가져올거 - hostel - 이름, 주소 , 평점, 체크인체크아웃 , 소개, 안내, 편의시설, 서비스 
		 // 	 file  - filepath (list)
		 // option -  (list) 
		//review 
		//System.out.println("쿼리 조회:"+hostel);
		
		return hostel;
	}

	public ArrayList<HostelOption> detailOptionList(HashMap<String, Object> optionMap) {
		List list = sqlSession.selectList("hostel.selectOptionList",optionMap);
		
		return (ArrayList<HostelOption>)list;
	}

	public ArrayList<HostelFile> searchHostelFile(int hostelCode) {
		List list = sqlSession.selectList("hostel.searchHostelFile",hostelCode);
		
		return (ArrayList<HostelFile>)list;
	}

	public HostelOption searchSelectedHostel(int optionNo) {
		HostelOption hostel = sqlSession.selectOne("hostel.searchSelectedHostel",optionNo);
		return hostel;
	}

	public int insertHostelPay(int payPrice) {
		int result = sqlSession.insert("hostel.insertHostelPay",payPrice);
		return result;
	}

	public int selectPayNo() {
		int payNo = sqlSession.selectOne("hostel.selectPayNo");
		return payNo;
	}

	public int insertHostelReserve(HashMap<String, Object> reserveMap) {
		int rhNo = sqlSession.insert("hostel.insertHostelReserve",reserveMap);
		
		return rhNo;
	}



	public String selectReservationNo() {
		String reserveNum = sqlSession.selectOne("hostel.selectReservationNum");
				
		return reserveNum;
	}
	public int insertReservedRoom(ReservedRoom rdr) {
		int result = sqlSession.insert("hostel.insertReservedRoom",rdr);
		return result;
	}

	public HostelReserve selectHostelReserve(String recentRvNo) {

		HostelReserve hr = sqlSession.selectOne("hostel.selectHostelReserve",recentRvNo);
				
		return hr;
	}

	public ArrayList<Hostel> filterHostelList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("hostel.selectHostelFilter",map);
		return (ArrayList<Hostel>)list;
	}



}
