<%@page import="java.io.PrintWriter"%>
<%@page import="product.ProductDAO"%>
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
	String userID = null;
	if(session.getAttribute("userID") != null)
	{
		userID = (String) session.getAttribute("userID");
	}
	int PRODUCT_NO = 0;
	if(request.getParameter("PRODUCT_NO")!=null){
		PRODUCT_NO= Integer.parseInt(request.getParameter("PRODUCT_NO"));
	}
	int count = Integer.parseInt(request.getParameter("num"));
	ProductDAO product = new ProductDAO();
	int result = product.addstock(PRODUCT_NO,count);
	if(result==-1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('재고 추가를 실패하였습니다.')");
		script.println("history.back()");
		script.println("</script>");	
	} else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('재고 추가를 성공하였습니다.')");
		script.println("location.href = 'Main.jsp'");
		script.println("</script>");	
	}
%>

</body>
</html>