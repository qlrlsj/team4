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

	public int insertMember(Member m) {
		int result = sqlSession.insert("member.insertMember",m); // 전달해줄것 m존재하니까 적어준다.
		return result;
	}

	public int updateOneMember(Member m) {
		int result = sqlSession.update("member.updateOneMember",m); 
		return result;
	}

	public ArrayList<Member> selectAllMember() {
		List list = sqlSession.selectList("member.selectAllMember"); //전달해줄 값은 없으므로 위에서 사용한 m은 생략
		return (ArrayList<Member>)list;
	}

}
