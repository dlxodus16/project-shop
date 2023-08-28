package order;

public class Order {
	private int ORDER_NO;
	private String MEMBER_ID;
	private String ORDER_DATE;
	private int ORDER_PRICE;
	public int getORDER_NO() {
		return ORDER_NO;
	}
	public void setORDER_NO(int oRDER_NO) {
		ORDER_NO = oRDER_NO;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getORDER_DATE() {
		return ORDER_DATE;
	}
	public void setORDER_DATE(String oRDER_DATE) {
		ORDER_DATE = oRDER_DATE;
	}
	public int getORDER_PRICE() {
		return ORDER_PRICE;
	}
	public void setORDER_PRICE(int oRDER_PRICE) {
		ORDER_PRICE = oRDER_PRICE;
	}
}
