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
</head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null)
	{
		userID = (String) session.getAttribute("userID");
	}
%>
<br>
<div class="container theme-showcase" align="center">
		<h1>재고관리 화면</h1>
</div>
<br><br>
<div class="container">
	<table class="table table-striped">
	<thead>
		<tr>
			<th width="40%" class="text-center">상품명</th>
			<th width="20%" class="text-center">재고 수</th>
			<th width="20%" class="text-center"></th>
			<th width="20%" class="text-center"></th>
		</tr>
	</thead>
	<tbody>
	<%
		ProductDAO product = new ProductDAO();
		ArrayList<Product> list = product.getList();
		for(int i=0;i<list.size();i++){
	%>
		<tr>
		<th width="40%" class="text-center"><%=list.get(i).getPRODUCT_NAME() %></th>
		<th width="20%" class="text-center"><%=list.get(i).getPRODUCT_STOCK() %></th>
		<form method="post" action="AddStock.jsp?PRODUCT_NO=<%=list.get(i).getPRODUCT_NO()%>">
		<th width="20%" class="text-center"><input type="number" name="num" required></th>
		<th width="20%" class="text-center"><input type="submit" value="추가"></th>
		</form>
	</tr>
	<%} %>
		</tbody>
	</table>
	<br>
	<div style="float:right">
	<a href="Main.jsp" class="btn-lg btn-primary">돌아가기</a>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>