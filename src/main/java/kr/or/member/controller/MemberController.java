package kr.or.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MemberPageData;
import kr.or.report.model.vo.Report;
import kr.or.seller.model.vo.ReserveData;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/login.kt")
	public String login(Member m, HttpSession session, Model model) { //index에서 보내준 name과 네이밍이 같으면 자동으로 VO객체로 묶어줌
		String login = "true";
		Member member = service.selectOneMember(m);
		if(member != null) {//조회결과가 존재하는 경우
			session.setAttribute("m", member); //세션에 m으로 member를 저장
			model.addAttribute("login", login);
		}
		
		return "member/login";
	}

	@RequestMapping(value="/logout.kt")
	public String logout(HttpSession session) { //HttpSession속성의 session값 불러옴
		session.invalidate();					//session파기
		return "redirect:/";					//원래 화면으로 복귀
	}
	
	
	@RequestMapping(value="/joinFrm.kt")
	public String joinFrm() {
		return "member/joinFrm";
	}
	
	@RequestMapping(value="/signUp.kt")
	public String join(Member m) {
		System.out.println("joinFrm.jsp에서 들어온 정보 : "+m);
		m.setMemberGrade(2);
		m.setMemberLevel(2);
		int result = service.insertMember(m); //insert문은 어차피 결과를 1,0으로 return하기에 int로 변수를 만들어 놓는다.
		if (result == 0) {
			System.out.println("회원가입이 실패했습니다.");
		}else {
			System.out.println("회원가입에 성공했습니다.");
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="/mypage.kt")
	public String mypage() {
		return "member/mypage";
	}
	
	@RequestMapping(value="/updateMember.kt")
	public String updateMember(Member m, HttpSession session) {  //회원정보 받아올 멤버, 정상변경후 세션에 적용해야하니 세션도 넣어놓는다
		System.out.println("asd");
		System.out.println("jsp에서 Controller로 들어온 정보 : "+m);
		int result = service.updateOneMember(m);
		if(result>0) {
			session.setAttribute("m", m);
			System.out.println("회원정보 변경이 완료 되었습니다.");
		}else {
			System.out.println("회원정보 변경에 실패 하였습니다.");
		}
		return "redirect:/mypage.kt";
	}
	
	@RequestMapping(value="/allMember.kt")
	public String allMember(int reqPage, Model model) {
//		MemberPageData mpd = service.selectMemberList(reqPage);
		ArrayList<Member> list = service.selectAllMember();
		model.addAttribute("list",list);
		return "member/allMember";
	}
	
	@ResponseBody//ajax사용을 위한 어노테이션 : ViewResolve가 관여하지 않도록 처리(주소값이 아닌 순수한 데이터를 return할때 사용)
	@RequestMapping(value="/idChk.kt")
	public String idChk(String memberId) {
		Member m = service.selectIdChk(memberId);
		if(m == null) {
			return "0";
		}else {
			return "1";
		}
	}
	
	@RequestMapping(value="/exileMember.kt")
	public String exileMember(int memberNo) {
		System.out.println("jsp에서 가져온 No값 : "+memberNo);
		int result = service.deleteOneMember(memberNo);
		if(result == 1) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		return "redirect:/";
	}
	
	@RequestMapping("/checkedChangeLevel.kt")
	public String checkedChangeLevel(int memberNo, int memberGrade, Model model){
		System.out.println("jsp에서 넘어온 정보 : "+memberNo+memberGrade);
//		Member m = new Member();
//		m.setMemberGrade(memberGrade);
		ArrayList<Member> list = service.checkedChangeLevel(memberNo,memberGrade);
		model.addAttribute("list",list);
		return "redirect:/";
	}
	@ResponseBody
	@RequestMapping(value="updateMemberPoint.kt", produces = "application/json;charset=utf-8")
	public String updateMemberPoint(int memberNo, int updatePoint) {
		int result = service.updateMemberPoint(memberNo, updatePoint);
		return String.valueOf(result);
	}
	@RequestMapping(value="/allReserveFrm.kt")
	public String reserveFrm() {
		return "member/allReserveFrm";
	}
	@RequestMapping(value="/allReserve.kt")
	public String reserveAll(Member m, String type, Model model) {
		ArrayList<ReserveData> rd = service.allReserve(m,type);
		model.addAttribute("list", rd);
		model.addAttribute("type", type);
		return "member/allReserve";
	}
	@RequestMapping(value="/blackListFrm.kt")
	public String blackListFrm(Model model) {
		ArrayList<Report> list = service.selectAllReport();
		model.addAttribute("list", list);
		return "member/blackList";
	}
}













