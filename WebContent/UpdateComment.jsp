<%@page import="comment.Comment"%>
<%@page import="comment.CommentDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<style>
.pull-right {
  float: right !important;
  margin-left: 15px;
}
</style>
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
	Comment comment = new CommentDAO().getcomment(COMMENT_NO);
%>
<br>
<div class="container theme-showcase" align="center">
	<h1>댓글 수정 화면</h1>
	<br><br>
</div>
<div class="container">
	<form method="post" action="UpdateActionComment.jsp?COMMENT_NO=<%=COMMENT_NO%>">	
		댓글 내용<textarea name="content" class="form-control" placeholder="내용을 입력해주세요."maxlength="1024" style="height: 150px;"required><%=comment.getCOMMENT_CONTENT() %></textarea><br>		
		<button class="btn btn-sm btn-info pull-right" type="submit">수정</button>
	</form>
	<button type="button" class="btn btn-sm btn-info pull-right" onclick="location.href='Main.jsp'">취소</button>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>