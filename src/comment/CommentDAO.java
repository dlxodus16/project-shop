package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CommentDAO {
	private Connection conn;
	private ResultSet result;
	
	public CommentDAO() {
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
		String sql = "SELECT COMMENT_NO FROM COMMENTS ORDER BY 1 DESC";
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
	
	public int write(int PRODUCT_NO, String MEMBER_ID, String COMMENT_CONTENT) {
		String sql = "INSERT INTO COMMENTS VALUES(?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,getNo());
			pstmt.setInt(2, PRODUCT_NO);
			pstmt.setString(3, MEMBER_ID);
			pstmt.setString(4, COMMENT_CONTENT);
			
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Comment> getList(int PRODUCT_NO){
		String sql = "SELECT * FROM COMMENTS WHERE PRODUCT_NO=? ORDER BY COMMENT_NO";
		ArrayList<Comment> list = new ArrayList<Comment>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, PRODUCT_NO);
			result = pstmt.executeQuery();
			while(result.next()) {
				Comment comment = new Comment();
				comment.setCOMMENT_NO(result.getInt(1));
				comment.setPRODUCT_NO(result.getInt(2));
				comment.setMEMBER_ID(result.getString(3));
				comment.setCOMMENT_CONTENT(result.getString(4));
				list.add(comment);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Comment getcomment(int COMMENT_NO) {
		String sql = "SELECT * FROM COMMENTS WHERE COMMENT_NO=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, COMMENT_NO);
			result = pstmt.executeQuery();
			if(result.next()) {
				Comment comment = new Comment();
				comment.setCOMMENT_NO(result.getInt(1));
				comment.setPRODUCT_NO(result.getInt(2));
				comment.setMEMBER_ID(result.getString(3));
				comment.setCOMMENT_CONTENT(result.getString(4));
				
				return comment;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}  return null;
	}
	
	public int update(int COMMENT_NO,String COMMENT_CONTENT) {
		String sql = "UPDATE COMMENTS SET COMMENT_CONTENT=? WHERE COMMENT_NO=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, COMMENT_CONTENT);
			pstmt.setInt(2, COMMENT_NO);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} return -1;
	}
	
	public int delete(int COMMENT_NO) {
		String sql = "DELETE FROM COMMENTS WHERE COMMENT_NO=?"; 
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, COMMENT_NO);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} return -1;
	}
}
