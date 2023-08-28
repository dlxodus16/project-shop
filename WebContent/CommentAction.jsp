<%@page import="java.io.PrintWriter"%>
<%@page import="comment.CommentDAO"%>
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
	int PRODUCT_NO = 0;
	if(request.getParameter("PRODUCT_NO")!=null){
		PRODUCT_NO = Integer.parseInt(request.getParameter("PRODUCT_NO"));
	}	
	String content = request.getParameter("content");
	CommentDAO comment = new CommentDAO();
	int result = comment.write(PRODUCT_NO,userID,content);
	if(result==-1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('댓글 쓰기에 실패했습니다')");
		script.println("history.back()");
		script.println("</script>");
	} else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'Main.jsp'");
		script.println("</script>");
	}
%>
</body>
</html>