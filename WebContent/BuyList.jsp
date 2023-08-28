<%@page import="product.Product"%>
<%@page import="product.ProductDAO"%>
<%@page import="order.Orderlist"%>
<%@page import="java.util.ArrayList"%>
<%@page import="order.OrderDAO"%>
<%@page import="java.text.DecimalFormat"%>
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
	DecimalFormat df = new DecimalFormat("###,###");
	String userID = null;
	if(session.getAttribute("userID") != null)
	{
		userID = (String) session.getAttribute("userID");
	}
%>
<br>
<div class="container theme-showcase" align="center">
		<h1>구매내역 화면</h1>
</div>

<br><br>
<div class="container">
	<table class="table table-striped">
	<thead>
		<tr>
			<th width="25%" class="text-center">상품명</th>
			<th width="25%" class="text-center">구매수량</th>
			<th width="25%" class="text-center">구매일</th>
			<th width="25%" class="text-center">가격</th>
		</tr>
	</thead>
	<tbody>
	<%
		OrderDAO order = new OrderDAO();
		ArrayList<Orderlist> list = order.getList(userID);
		for(int i=0;i<list.size();i++){
			ProductDAO product = new ProductDAO();
			Product pro = product.getproduct(list.get(i).getPRODUCT_NO());
			String f = df.format(pro.getPRODUCT_PRICE());
	%>
		<tr>
		<th width="25%" class="text-center"><%=pro.getPRODUCT_NAME() %></th>
		<th width="25%" class="text-center"><%=list.get(i).getORDER_COUNT() %></th>
		<th width="25%" class="text-center"><%=list.get(i).getORDER_DATE() %></th>
		<th width="25%" class="text-center"><%=f %></th>
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