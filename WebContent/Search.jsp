<%@page import="java.text.DecimalFormat"%>
<%@page import="product.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<style>
	.center{text-align:center;}
</style>
</head>
<body>
<%
	DecimalFormat df = new DecimalFormat("###,###");
	String userID = null;
	if(session.getAttribute("userID") != null)
	{
		userID = (String) session.getAttribute("userID");
	}
	request.setCharacterEncoding("utf-8");
	String searchName = request.getParameter("searchName");
%>
<div class="container theme-showcase" align="center">
	<h1>상품 검색 화면</h1>
	<br><br><br><br><br>
</div>
<div class="container">
<table border="1" >
		<%
			ProductDAO product = new ProductDAO();
			ArrayList<Product> list = product.search(searchName);
			int size = list.size();
			for(int i=0;i<size;i++){
				int price = list.get(i).getPRODUCT_PRICE();
				String f = df.format(price);
				if(i%5==0){
		%>
		<tr>
		<%} %>
			<td width="20%" class="center"><%=list.get(i).getPRODUCT_NAME() %>
			<%if(list.get(i).getPRODUCT_STOCK()==0){ %>
			<a style="color:red">[품절]</a>
			<%} %><br>
			<a href="viewProduct.jsp?PRODUCT_NO=<%=list.get(i).getPRODUCT_NO()%>">
			<img src="fileSave/<%=list.get(i).getPRODUCT_IMAGE() %>" width="100%"><br>
			</a>
			<%=f %></td>
				<% 
				if(i%5==4){
				%>
		</tr>
		<%
				}
				%>
		<%		
			}
		%>
	</table>
	<br><br>
	<div style="float:right">
	<a href="Main.jsp" class="btn-lg btn-primary">돌아가기</a>
	</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>