<%@page import="member.MemberDAO"%>
<%@page import="member.Member"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	Member user = new Member(id,pw);
	MemberDAO userDAO = new MemberDAO();
	int result = userDAO.login(id,pw);
	if(result==1){
		session.setAttribute("userID",user.getMEMBER_ID());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'Main.jsp'");
		script.println("</script>");
	} else if(result == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디와 비밀번호를 확인해주세요.')");
		script.println("history.back()");
		script.println("</script>");
	} else if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else if(result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('DB오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
%>
</body>
</html>