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
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String pwcheck = request.getParameter("pwcheck");
	String name = request.getParameter("name");
	Member member = new Member(id,pw,name);
	
	MemberDAO user = new MemberDAO();
	if(pw.equals(pwcheck)){
		int result = user.join(member);	
		if(result==-1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디 입니다.')");
			script.println("history.back()");
			script.println("</script>");	
		} else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'Main.jsp'");
			script.println("</script>");	
		}
	} else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.')");		
		script.println("history.back()");
		script.println("</script>");
	}
%>
</body>
</html>