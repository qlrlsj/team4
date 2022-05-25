package kr.or.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;
	
	public Member selectOneMember(Member m) {
		// TODO Auto-generated method stub
		if(m.getMemberId().isEmpty() || m.getMemberPw().isEmpty()) {
			throw new IllegalArgumentException("아이디나 패스워드를 입력해야 합니다.");
		}
		Member member = dao.selectOneMember(m);
		return member;
	}

	public int insertMember(Member m) {
		return dao.insertMember(m); //dao에 컨트롤러에서 받은 m을 전달하고 결과값(1,0)을 돌려받는다.
	}

	public int updateOneMember(Member m) {
		return dao.updateOneMember(m);
	}

	public ArrayList<Member> selectAllMember() {
		return dao.selectAllMember();
	}
}
