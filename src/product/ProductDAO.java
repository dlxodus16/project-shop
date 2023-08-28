package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;




public class ProductDAO {
	private Connection conn;
	private ResultSet result;
	
	public ProductDAO() {
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
		String sql = "SELECT PRODUCT_NO FROM PRODUCT ORDER BY 1 DESC";
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
	
	public int write(String PRODUCT_NAME, String PRODUCT_MODEL, int PRODUCT_PRICE, int PRODUCT_STOCK, String PRODUCT_CONTENT, String PRODUCT_IMAGE) {
		String sql = "SELECT * FROM PRODUCT WHERE PRODUCT_IMAGE = ?";
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,PRODUCT_IMAGE);
			result = pstmt.executeQuery();
			if(!result.next()) {
			sql = "INSERT INTO PRODUCT VALUES(?,?,?,?,?,?,?)";
	
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,getNo());
			pstmt.setString(2, PRODUCT_NAME);
			pstmt.setString(3, PRODUCT_MODEL);
			pstmt.setInt(4, PRODUCT_PRICE);
			pstmt.setInt(5, PRODUCT_STOCK);
			pstmt.setString(6, PRODUCT_CONTENT);
			pstmt.setString(7, PRODUCT_IMAGE);
			
			return pstmt.executeUpdate();
			} else{
				return 0;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Product> getList(){
		String sql = "SELECT * FROM Product order by 1 desc";
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			result = pstmt.executeQuery();
			while(result.next()) {
				Product product = new Product();
				product.setPRODUCT_NO(result.getInt(1));
				product.setPRODUCT_NAME(result.getString(2));
				product.setPRODUCT_MODEL(result.getString(3));
				product.setPRODUCT_PRICE(result.getInt(4));
				product.setPRODUCT_STOCK(result.getInt(5));
				product.setPRODUCT_CONTENT(result.getString(6));
				product.setPRODUCT_IMAGE(result.getString(7));
				list.add(product);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Product getproduct(int PRODUCT_NO) {
		String sql = "SELECT * FROM PRODUCT WHERE PRODUCT_NO=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, PRODUCT_NO);
			result = pstmt.executeQuery();
			if(result.next()) {
				Product product = new Product();
				product.setPRODUCT_NO(result.getInt(1));
				product.setPRODUCT_NAME(result.getString(2));
				product.setPRODUCT_MODEL(result.getString(3));
				product.setPRODUCT_PRICE(result.getInt(4));
				product.setPRODUCT_STOCK(result.getInt(5));
				product.setPRODUCT_CONTENT(result.getString(6));
				product.setPRODUCT_IMAGE(result.getString(7));
				
				return product;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}  return null;
	}
	
	public int update(int PRODUCT_NO,String name,String model,int price,int stock,String content,String image) {
		String sql = "UPDATE PRODUCT SET PRODUCT_NAME=?,PRODUCT_MODEL=?,PRODUCT_PRICE=?,PRODUCT_STOCK=?,PRODUCT_CONTENT=?,PRODUCT_IMAGE=? WHERE PRODUCT_NO=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, model);
			pstmt.setInt(3, price);
			pstmt.setInt(4, stock);
			pstmt.setString(5, content);
			pstmt.setString(6, image);
			pstmt.setInt(7, PRODUCT_NO);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} return -1;
	}
	
	public int delete(int PRODUCT_NO) {
		String sql = "DELETE FROM PRODUCT WHERE PRODUCT_NO=?"; 
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, PRODUCT_NO);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} return -1;
	}
	
	public int addstock(int PRODUCT_NO,int PRODUCT_COUNT) {
		String sql = "UPDATE PRODUCT SET PRODUCT_STOCK = PRODUCT_STOCK + ? WHERE PRODUCT_NO = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, PRODUCT_COUNT);
			pstmt.setInt(2, PRODUCT_NO);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} return -1;
	}
	
	public ArrayList<Product> search(String PRODUCT_NAME) {
		String sql = "SELECT * FROM PRODUCT WHERE PRODUCT_NAME like ? ORDER BY PRODUCT_NO DESC";
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+PRODUCT_NAME+"%");
			result = pstmt.executeQuery();
			while(result.next()) {
				Product product = new Product();
				product.setPRODUCT_NO(result.getInt(1));
				product.setPRODUCT_NAME(result.getString(2));
				product.setPRODUCT_MODEL(result.getString(3));
				product.setPRODUCT_PRICE(result.getInt(4));
				product.setPRODUCT_STOCK(result.getInt(5));
				product.setPRODUCT_CONTENT(result.getString(6));
				product.setPRODUCT_IMAGE(result.getString(7));
				list.add(product);
			} 
		}catch (Exception e) {
			e.printStackTrace();
		} return list;
	}
}
