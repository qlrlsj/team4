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
import kr.or.report.model.vo.Report;
import kr.or.seller.model.vo.ReserveData;

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

	public ArrayList<Member> checkedChangeLevel(String memberNo, String memberGrade) {
		System.out.println("Controller에서 넘어온 memberNo : "+memberNo);
		System.out.println("Controller에서 넘어온 memberGrade : "+memberGrade);
		
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("num", memberNo);
		map.put("level", memberGrade);
		System.out.println("Service에서 합쳐진 Hash Map : "+map);
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



	public ArrayList<ReserveData> allReserve(Member m, String type) {
		return dao.allReserve(m,type);
	}

	public ArrayList<Report> selectAllReport() {
		return dao.selectAllReport();
	}
//	public Member selectOneMember1(Member m) {
//		Member member = dao.selectOneMember1(m);
//		return member;
//	}

	public int changeGrade(Member m) {
		return dao.changeGrade(m);
	}

	public Report blackCheck(Member member) {
		return dao.blackCheck(member);
	}

}
