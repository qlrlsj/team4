package kr.or.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

//import kr.or.member.controller.SHA256Enc;
import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MemberPageData;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;
//	@Autowired
//	private SHA256Enc enc;
	
	public Member selectOneMember(Member m) {
		// TODO Auto-generated method stub
//		try {
//			String encPw = enc.endData(m.getMemberPw());
//			m.setMemberPw(encPw);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		if(m.getMemberId().isEmpty() || m.getMemberPw().isEmpty()) {
			throw new IllegalArgumentException("아이디나 패스워드를 입력해야 합니다.");
		}
		Member member = dao.selectOneMember(m);
		return member;
	}

	public int insertMember(Member m) {
//		try {
//			String encPw = enc.endData(m.getMemberPw());
//			m.setMemberPw(encPw);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		return dao.insertMember(m); //dao에 컨트롤러에서 받은 m을 전달하고 결과값(1,0)을 돌려받는다.
	}

	public int updateOneMember(Member m) {
//		try {
//			String encPw = enc.endData(m.getMemberPw());
//			m.setMemberPw(encPw);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		return dao.updateOneMember(m);
	}

	public ArrayList<Member> selectAllMember() {
		return dao.selectAllMember();
	}

	public Member selectIdChk(String memberId) {
		return dao.selectIdChk(memberId);
	}

	public int deleteOneMember(int memberNo) {
		return dao.deleteOneMember(memberNo);
	}

	public ArrayList<Member> checkedChangeLevel(int num, int level) {
		/*
		 * Mybatis에서는 selectOne, selectList, update, insert, delete 메소드로 쿼리문 수행
		 * 각 쿼리문 수행 메소드의 첫번째 매개변수 : "mapper이름.쿼리문id"
		 * 각 쿼리문 수행 메소드의 두번째 매개변수 : 쿼리문 수행시 필요한 데이터
		 * 매개변수로 전달할 수 있는 데이터의 갯수는 무조건 1개
		 * 전달해야할 데이터가 여러개인 경우에는?(아래)
		 * 	1) VO
		 * 	2) Map
		 * 
		 */
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("num", num);
		map.put("level", level);
		return dao.checkedChangeLevel(map);
	}

	public MemberPageData selectMemberList(int reqPage) {
		return null;
	}

	public int updateMemberPoint(int memberNo, int updatePoint) {
		// TODO Auto-generated method stub
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("memberNo", memberNo);
		map.put("updatePoint", updatePoint);
		return dao.updateMemberPoint(map);
	}


//	public Member selectOneMember1(Member m) {
//		Member member = dao.selectOneMember1(m);
//		return member;
//	}

}
