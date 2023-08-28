<%@page import="product.Product"%>
<%@page import="product.ProductDAO"%>
<%@page import="order.OrderDAO"%>
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
	String userID = null;
	if(session.getAttribute("userID") != null)
	{
		userID = (String) session.getAttribute("userID");
	}
	int PRODUCT_NO = 0;
	if(request.getParameter("PRODUCT_NO")!=null){
		PRODUCT_NO= Integer.parseInt(request.getParameter("PRODUCT_NO"));
	}
	int ORDER_PRICE = 0;
	if(request.getParameter("ORDER_PRICE")!=null){
		ORDER_PRICE= Integer.parseInt(request.getParameter("ORDER_PRICE"));
	}
	if (ORDER_PRICE == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.')");
		script.println("location.href = 'Main.jsp'");
		script.println("</script>");
	}
	int count = Integer.parseInt(request.getParameter("num"));
	ProductDAO product = new ProductDAO();
	Product pro = product.getproduct(PRODUCT_NO);
	int stock = pro.getPRODUCT_STOCK();
	if(count>stock){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('재고량이 부족합니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		OrderDAO order = new OrderDAO();
		int result = order.buydirect(userID,ORDER_PRICE,count,PRODUCT_NO);
		if(result==-1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('구매를 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('구매를 하였습니다.')");
			script.println("location.href='Main.jsp'");
			script.println("</script>");
		}
	}
	
%>
</body>
</html>