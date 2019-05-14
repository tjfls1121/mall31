package cafe.jjdev.mall.service;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cafe.jjdev.mall.mapper.MemberMapper;
import cafe.jjdev.mall.vo.Member;

@Service
public class MemberService {
	@Autowired private MemberMapper memberMapper;
	
	// 로그인
	public Member Login(Member member) {
		return memberMapper.selectForLogin(member);
	}
	
	// 회원추가
	public void addMember(Member member) {
		memberMapper.insertMember(member);
	}
	
	// 아이디 중복 확인시 사용
	public int checkDupId(String memberId) {
		String idOutMember = memberMapper.selectOutMember(memberId);
		System.out.println("idOutMember : "+idOutMember);
		String idMember = memberMapper.selectMemberId(memberId);
		System.out.println("idMember:"+idMember);
		
		int memberIdResult = 0;
		if(idOutMember==null && idMember == null) {
			 memberIdResult=1;
		}
		return memberIdResult;
	}
	
	// 개인정보 보기
	public Member getMember(String memberId) {
		return memberMapper.selectMember(memberId);
	}
	
	// 개인정보 수정화면
	public Member getForUpdateMember(String memberId) {
		return memberMapper.selectMember(memberId);
	}
	
	// 개인정보 수정 액션
	public int updateMember(Member member) {
		return memberMapper.updateMember(member);
	}

	// 비밀번호 수정 액션
	public int updateMemberPw(Map<String, Object> map) {
		memberMapper.updateMemberPw(map);
		return 0;
	}
	
	// 회원탈퇴 폼
	public Member selectForDelete(String memberId) {
		return memberMapper.selectForDelete(memberId);
	}
	
	// 회원탈퇴 액션
	public int removeMember(Member member) {
		return memberMapper.deleteMember(member);
	}
	
	// 탈퇴회원 member_out 테이블에 추가
	public int addOutMember(Member member) {
		return memberMapper.insertOutMember(member);
	}
	
	// 아이디 찾기
	public Member selectForFindId(Member member) {
		return memberMapper.selectForFindId(member);
	}
	
	// 비밀번호 찾기
	public Member getForFindPw(Member member) {
		return memberMapper.selectForFindPw(member);
	}

}
