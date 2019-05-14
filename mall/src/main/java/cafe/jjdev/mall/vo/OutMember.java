package cafe.jjdev.mall.vo;

public class OutMember {
	private int memberOutNo;
	private String memberOutId;
	private String memberOutDate;
	public int getMemberOutNo() {
		return memberOutNo;
	}
	public void setMemberOutNo(int memberOutNo) {
		this.memberOutNo = memberOutNo;
	}
	public String getMemberOutId() {
		return memberOutId;
	}
	public void setMemberOutId(String memberOutId) {
		this.memberOutId = memberOutId;
	}
	public String getMemberOutDate() {
		return memberOutDate;
	}
	public void setMemberOutDate(String memberOutDate) {
		this.memberOutDate = memberOutDate;
	}
	@Override
	public String toString() {
		return "OutMember [memberOutNo=" + memberOutNo + ", memberOutId=" + memberOutId + ", memberOutDate="
				+ memberOutDate + "]";
	}
	
}
