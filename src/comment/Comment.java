package comment;

public class Comment {
	private int COMMENT_NO;
	private int PRODUCT_NO;
	private String MEMBER_ID;
	private String COMMENT_CONTENT;
	
	public int getCOMMENT_NO() {
		return COMMENT_NO;
	}
	public void setCOMMENT_NO(int cOMMENT_NO) {
		COMMENT_NO = cOMMENT_NO;
	}
	public int getPRODUCT_NO() {
		return PRODUCT_NO;
	}
	public void setPRODUCT_NO(int pRODUCT_NO) {
		PRODUCT_NO = pRODUCT_NO;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getCOMMENT_CONTENT() {
		return COMMENT_CONTENT;
	}
	public void setCOMMENT_CONTENT(String cOMMENT_CONTENT) {
		COMMENT_CONTENT = cOMMENT_CONTENT;
	}
}
