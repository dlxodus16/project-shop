package order;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import basket.Basket;

public class OrderDAO {
	private Connection conn;
	private ResultSet result;
	
	public OrderDAO() {
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
	
	public int getNo() {
		String sql = "SELECT ORDER_NO FROM ORDERS ORDER BY 1 DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			result = pstmt.executeQuery();
			if(result.next()) {
				return result.getInt(1)+1;
			}
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int buy(String MEMBER_ID,int ORDER_PRICE,ArrayList<Basket> basket) {
		String sql = "INSERT INTO ORDERS VALUES(?,?,sysdate,?)";
		try {
			int No = getNo();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, No);
			pstmt.setString(2, MEMBER_ID);
			pstmt.setInt(3,ORDER_PRICE);
			pstmt.executeUpdate();
			
			for(int i=0;i<basket.size();i++){ 
				sql="INSERT INTO ORDER_DETAIL VALUES(?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, No);
				pstmt.setInt(2, basket.get(i).getPRODUCT_NO());
				pstmt.setInt(3, basket.get(i).getPRODUCT_COUNT());
				pstmt.executeUpdate();
			}
			
			sql = "DELETE FROM BASKET WHERE MEMBER_ID=?"; 
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, MEMBER_ID);
		
			return pstmt.executeUpdate();			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return 1;
	}
	
	public int buydirect(String MEMBER_ID, int ORDER_PRICE, int ORDER_COUNT, int PRODUCT_NO){
		String sql = "UPDATE PRODUCT SET PRODUCT_STOCK = PRODUCT_STOCK - ? WHERE PRODUCT_NO = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ORDER_COUNT);
			pstmt.setInt(2, PRODUCT_NO);
			pstmt.executeUpdate();
			
			sql = "INSERT INTO ORDERS VALUES(?,?,sysdate,?)";			
			int No = getNo();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, No);
			pstmt.setString(2, MEMBER_ID);
			pstmt.setInt(3,ORDER_PRICE);
			pstmt.executeUpdate();
			
			sql = "INSERT INTO ORDER_DETAIL VALUES(?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,No);
			pstmt.setInt(2,PRODUCT_NO);
			pstmt.setInt(3, ORDER_COUNT);			
			return pstmt.executeUpdate();			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return 1;
	}
	
	public ArrayList<Order> getList(){
		String sql = "select * from orders order by 1 desc";
		ArrayList<Order> list = new ArrayList<Order>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			result = pstmt.executeQuery();
			while(result.next()) {
				Order order= new Order();
				order.setORDER_NO(result.getInt(1));
				order.setMEMBER_ID(result.getString(2));
				order.setORDER_DATE(result.getString(3));
				order.setORDER_PRICE(result.getInt(4));
				list.add(order);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Orderlist> getList(String MEMBER_ID){
		String sql = "select order_date,order_count,product_no from orders join order_detail on orders.order_no = order_detail.order_no where member_id = ? order by 1 desc";
		ArrayList<Orderlist> list = new ArrayList<Orderlist>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,MEMBER_ID);
			result = pstmt.executeQuery();
			while(result.next()) {
				Orderlist orderlist = new Orderlist();
				orderlist.setORDER_DATE(result.getString(1));
				orderlist.setORDER_COUNT(result.getInt(2));
				orderlist.setPRODUCT_NO(result.getInt(3));
				list.add(orderlist);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Orderdetail> getList(int ORDER_NO){
		String sql = "select * from order_detail where order_no = ?";
		ArrayList<Orderdetail> list = new ArrayList<Orderdetail>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,ORDER_NO);
			result = pstmt.executeQuery();
			while(result.next()) {
				Orderdetail orderlist = new Orderdetail();
				orderlist.setORDER_NO(result.getInt(1));
				orderlist.setPRODUCT_NO(result.getInt(2));
				orderlist.setORDER_COUNT(result.getInt(3));
				list.add(orderlist);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
