package basket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import product.Product;

public class BasketDAO {
	private Connection conn;
	private ResultSet result;
	
	public BasketDAO() {
		try {
			String URL = "jdbc:oracle:thin:@localhost:1521:dlxodus16";
			String ID = "shop";
			String PW = "lee00824";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(URL,ID,PW);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int add(int PRODUCT_NO,String MEMBER_ID,int PRODUCT_COUNT) {
		String sql = "UPDATE PRODUCT SET PRODUCT_STOCK = PRODUCT_STOCK - ? WHERE PRODUCT_NO = ?";
		int result = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, PRODUCT_COUNT);
			pstmt.setInt(2, PRODUCT_NO);
			pstmt.executeUpdate();
		
			sql = "INSERT INTO BASKET VALUES(?,?,?)";		

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,PRODUCT_NO);
			pstmt.setString(2,MEMBER_ID);
			pstmt.setInt(3,PRODUCT_COUNT);
			result = pstmt.executeUpdate();
			return result;
		} catch(Exception e){
			e.printStackTrace();
		} return 0;
		
	}
	
	public ArrayList<Basket> getList(String MEMBER_ID){
		String sql = "SELECT * FROM BASKET WHERE MEMBER_ID=?";
		ArrayList<Basket> list = new ArrayList<Basket>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,MEMBER_ID);
			result = pstmt.executeQuery();
			while(result.next()) {
				Basket basket = new Basket();
				basket.setPRODUCT_NO(result.getInt(1));
				basket.setMEMBER_ID(result.getString(2));
				basket.setPRODUCT_COUNT(result.getInt(3));
				list.add(basket);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int delete(int PRODUCT_NO,String MEMBER_ID,int PRODUCT_COUNT) {
		String sql = "UPDATE PRODUCT SET PRODUCT_STOCK = PRODUCT_STOCK + ? WHERE PRODUCT_NO = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,PRODUCT_COUNT);
			pstmt.setInt(2, PRODUCT_NO);
			pstmt.executeUpdate();

			sql = "DELETE FROM BASKET WHERE PRODUCT_NO=? AND MEMBER_ID=?"; 
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, PRODUCT_NO);
			pstmt.setString(2, MEMBER_ID);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} return -1;
	}
}
