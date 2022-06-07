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
import kr.or.hostel.model.vo.ReservableRoom;
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


}
