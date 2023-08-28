package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class MemberDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet result;
	
	public MemberDAO() {
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
	
	public int login(String MEMBER_ID,String MEMBER_PW) {
		String SQL = "SELECT MEMBER_PW FROM MEMBER WHERE MEMBER_ID=?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,MEMBER_ID);
			result = pstmt.executeQuery();
			if(result.next()) {							
				if(result.getString(1).equals(MEMBER_PW)) {
					return 1; //로그인 성공
				} else {
					return 0; //로그인 실패
				}
				
			} return -1;  //아이디 존재 X
						
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	public int join(Member user) {
		int result = -1;
		String SQL = "INSERT INTO MEMBER VALUES(?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,user.getMEMBER_ID());
			pstmt.setString(2,user.getMEMBER_PW());
			pstmt.setString(3,user.getMEMBER_NAME());
			result = pstmt.executeUpdate();
		} catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public int doublecheck(String id) {
		String SQL = "SELECT * FROM MEMBER WHERE MEMBER_ID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,id);
			result = pstmt.executeQuery();
			if(result.next()) {
				return 0; //중복
			} else {
				return 1; //사용 가능
			}
		} catch(Exception e) {
			e.printStackTrace();
		} return -1;
	}
}
