<%@page import="product.Product"%>
<%@page import="product.ProductDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="basket.BasketDAO"%>
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
		PRODUCT_NO= Integer.parseInt(request.getParameter("PRODUCT_NO"));
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
		BasketDAO basket = new BasketDAO();
		int result = basket.add(PRODUCT_NO,userID,count);
		if(result==-1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('장바구니 추가에 실패하였습니다.')");
			script.println("history.back()");
			script.println("</script>");	
		} else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'Main.jsp'");
			script.println("</script>");	
		}
	}
%>
</body>
</html>