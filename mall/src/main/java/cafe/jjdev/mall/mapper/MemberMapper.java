package cafe.jjdev.mall.mapper;

import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import cafe.jjdev.mall.vo.Member;

@Mapper
public interface MemberMapper {
	// login
	public Member selectForLogin(Member member);
	
	// 개인정보 보기
	public Member selectMember(String memberId);
	
	// 회원탈퇴시 비밀번호 입력을 위한 메소드
	public Member selectForDelete(String memberId);
	
	// 아이디찾기
	public Member selectForFindId(Member member);
	
	// 비밀번호 찾기
	public Member selectForFindPw(Member member);
	
	// member_out테이블에서 member_out_id 가져오기
	public String selectOutMember(String memberId);
	
	// member테이블에서 member_id가져오기
	public String selectMemberId(String memberId);
	
	// 회원가입
	public int insertMember(Member member);
	
	// 회원탈퇴 후 member_out테이블로 아이디 이동
	public int insertOutMember(Member member);
	
	// 회원정보 수정
	public int updateMember(Member member);
	
	// 비밀번호 수정
	public int updateMemberPw(Map<String, Object> map);
	
	// 회원탈퇴
	public int deleteMember(Member member);
}
