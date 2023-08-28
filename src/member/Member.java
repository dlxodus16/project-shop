package member;

public class Member {
	private String MEMBER_ID;
	private String MEMBER_PW;
	private String MEMBER_NAME;
	
	public Member(String id, String pw) {
		this.MEMBER_ID = id;
		this.MEMBER_PW = pw;		
	}
	
	public Member(String id, String pw, String name) {
		this.MEMBER_ID = id;
		this.MEMBER_PW = pw;
		this.MEMBER_NAME = name;
	}
	
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getMEMBER_PW() {
		return MEMBER_PW;
	}
	public void setMEMBER_PW(String mEMBER_PW) {
		MEMBER_PW = mEMBER_PW;
	}
	public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}
	public void setMEMBER_NAME(String mEMBER_NAME) {
		MEMBER_NAME = mEMBER_NAME;
	}
}
