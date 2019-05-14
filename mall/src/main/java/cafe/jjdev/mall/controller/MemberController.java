package cafe.jjdev.mall.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cafe.jjdev.mall.service.MemberService;
import cafe.jjdev.mall.vo.Member;

@Controller
public class MemberController {
	@Autowired private MemberService memberService;
	
	// 1. 로그인 폼
	@GetMapping("/member/login")
	public String getMember(HttpSession session) {
		if(session.getAttribute("loginMember") != null ) {
			return "redirect:/";
		} else {
			return "/member/login";
		}
	}
	
	// 2. 로그인 액션
	@PostMapping("/member/login")
	public String getMember(HttpSession session, Member member) {
		Member loginMember = memberService.Login(member);
		System.out.println("loginMember : "+loginMember);
		
		if(loginMember == null ) {
			return "redirect:/member/login";
		} else {
			session.setAttribute("loginMember", loginMember);
			return "redirect:/";
		}
	}
	
	// 3. 로그아웃
	@GetMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// 4. 회원가입  폼 GET addMember
	@GetMapping("/member/addMember")
	public String addBoard() {
		return "/member/addMember";
	}
	
	// 5. 회원가입 액션 POST addMember
	@PostMapping("/member/addMember")
	public String addMember(Member member) {
		memberService.addMember(member);
		return "redirect:/member/login";
	}
	
	// 회원가입시 아이디 중복확인
	@GetMapping("/member/checkId")
	public String checkId() {
		return "/member/checkId";
	}
	
	@PostMapping("/member/checkId")
	public String checkDuplicationId(String memberId, Model model) {
		int memberIdResult = memberService.checkDupId(memberId);
		System.out.println("[checkDuplicationId]memberIdResult:"+memberIdResult);
		if(memberIdResult == 1) {
			model.addAttribute("memberId", memberId);
			return "/member/addMember";
		}else {
			return "/member/checkId";
		}
	}
	
	// 6. 개인정보확인
	@GetMapping("/member/getMember")
	public String getMember(Model model, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		System.out.println("[MemberController]getMember loginMember:"+loginMember);
		
		Member member = memberService.getMember(loginMember.getMemberId());
		System.out.println("[MemberController]getMember member :"+member);
		
		model.addAttribute("member", member);
		
		return "/member/getMember";
	}

	// 7. 비밀번호 수정 폼
	@GetMapping("/member/modifyMemberPw")
	public String modifyMemberPw(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("loginMember");
		model.addAttribute("member",member);
		return "/member/modifyMemberPw";
	}

	// 8. 비밀번호 수정 액션
	@PostMapping("/member/modifyMemberPw")
	public String updateMemberPw(Member member, @RequestParam(value="memberPwNew", required=true) String memberPwNew) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", member.getMemberId());
		map.put("memberPw", member.getMemberPw());
		map.put("memberPwNew", memberPwNew);
		memberService.updateMemberPw(map);
		return "redirect:/member/getMember";
	}
	
	// 9. 회원정보 수정 폼
	@GetMapping("/member/modifyMember")
	public String getForUpdateMember(Model model, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		System.out.println("[MemberController]getMember loginMember:"+loginMember);
		
		Member member = memberService.getMember(loginMember.getMemberId());
		System.out.println("[MemberController]getMember member :"+member);
		
		model.addAttribute("member", member);
		
		return "/member/modifyMember";
	}
	
	// 10. 회원정보 수정 액션
	@PostMapping("/member/modifyMember")
	public String modifyMember(Member member) {
		memberService.updateMember(member);
		return "/member/getMember";
	}

	// 11. 회원탈퇴 폼		MemberController.removeMember --> deleteMember.jsp
	@GetMapping("/member/removeMember")
	public String deleteMember(Model model, HttpSession session) {
		Member sessionMember = (Member) session.getAttribute("loginMember");
		System.out.println("[deleteMember] sessionMember : "+sessionMember);
		model.addAttribute("memberId", sessionMember.getMemberId());
		return "/member/removeMember";
	}
	
	// 12. 회원탈퇴 액션		MemberController.removeMember --> MemberService.removeMember -->
	// 15. member_out_id 테이블 생성 후 탈퇴시 사용 ID 저장, 멤버 탈퇴 후에도 아이디 영구보장방법 구현
	@PostMapping(value="/member/removeMember")
	public String deleteMember(Member member, HttpSession session) {
		System.out.println("[deleteMember] member : "+member);
		Member sessionId = (Member) session.getAttribute("loginMember");
		member.setMemberId(sessionId.getMemberId());
		System.out.println("[deleteMember] member.getId : "+member.getMemberId());
		memberService.removeMember(member);
		memberService.addOutMember(member);
		session.invalidate();
		return "redirect:/";
	}
	
	// 13. 아이디 찾기
	@GetMapping("/member/findId")
	public String findIdByGet() {
		return "/member/findId";
	}
	
	@PostMapping("/member/findId")
	public String findIdByPost(Model model, Member member) {
		Member memberId = memberService.selectForFindId(member);
		System.out.println("[findIdByPost] memberId : "+memberId);
		model.addAttribute("memberId",memberId.getMemberId());
		return "/member/showId";
	}

	// 14. 비밀번호 찾기, 멤버테이블에 메일 컬럼 추가 후 비밀번호 분실시 메일로 발송
	@GetMapping("/member/findPw")
	public String findPwByGet() {
		return "/member/findPw";
	}
	
}
