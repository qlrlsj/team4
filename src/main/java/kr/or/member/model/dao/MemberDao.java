package kr.or.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Member;

@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession; //Mybatis부터는 servlet-context.xml에서 만든 객체인 sqlSession을 사용한다 

	public Member selectOneMember(Member m) {
		Member member = sqlSession.selectOne("member.selectOneMember",m); 
		return member;
	}

}
