package kr.or.hostel.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Member;

@Repository
public class HostelDao {
	@Autowired
	private SqlSessionTemplate sqlSession; //마이바티스 쿼리용 


}
