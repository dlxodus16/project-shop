package basket;

public class Basket {
	private int PRODUCT_NO;
	private String MEMBER_ID;
	private int PRODUCT_COUNT;
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
	public int getPRODUCT_COUNT() {
		return PRODUCT_COUNT;
	}
	public void setPRODUCT_COUNT(int pRODUCT_COUNT) {
		PRODUCT_COUNT = pRODUCT_COUNT;
	}
}
