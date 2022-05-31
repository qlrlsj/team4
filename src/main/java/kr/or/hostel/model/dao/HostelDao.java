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


}
