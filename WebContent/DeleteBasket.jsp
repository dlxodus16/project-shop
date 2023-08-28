<%@page import="basket.BasketDAO"%>
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
	int PRODUCT_NO = 0;
	if(request.getParameter("PRODUCT_NO")!=null){
		PRODUCT_NO = Integer.parseInt(request.getParameter("PRODUCT_NO"));
	}
	if (PRODUCT_NO == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글 입니다.')");
		script.println("location.href = 'Main.jsp'");
		script.println("</script>");
	}
	int PRODUCT_COUNT = 0;
	if(request.getParameter("PRODUCT_COUNT")!=null){
		PRODUCT_COUNT = Integer.parseInt(request.getParameter("PRODUCT_COUNT"));
	}
	BasketDAO basket = new BasketDAO();
	int result = basket.delete(PRODUCT_NO,userID,PRODUCT_COUNT);
	if(result==-1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('장바구니 삭제를 실패했습니다.')");
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