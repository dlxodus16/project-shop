<%@page import="comment.CommentDAO"%>
<%@page import="comment.Comment"%>
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
	String userID = null;
	if(session.getAttribute("userID") != null)
	{
		userID = (String) session.getAttribute("userID");
	}
	int COMMENT_NO = 0;
	if(request.getParameter("COMMENT_NO")!=null){
		COMMENT_NO = Integer.parseInt(request.getParameter("COMMENT_NO"));
	}
	if (COMMENT_NO == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 댓글 입니다.')");
		script.println("location.href = 'Main.jsp'");
		script.println("</script>");
	}
	
	CommentDAO commentdao = new CommentDAO();
	int result = commentdao.delete(COMMENT_NO);
	if(result==-1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('댓글 삭제를 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='Main.jsp'");
		script.println("</script>");
	}
	%>
</body>
</html>