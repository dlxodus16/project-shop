<%@page import="product.Product"%>
<%@page import="product.ProductDAO"%>
<%@page import="order.Orderdetail"%>
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
	int ORDER_NO = 0;
	if(request.getParameter("ORDER_NO")!=null){
		ORDER_NO= Integer.parseInt(request.getParameter("ORDER_NO"));
	}
%>
<br>
<div class="container theme-showcase" align="center">
		<h1>판매상황 화면</h1>
</div>
<br><br>
<div class="container">
	<table class="table table-striped">
	<thead>
		<tr>
			<th width="33%" class="text-center">상품명</th>
			<th width="33%" class="text-center">구매수량</th>
			<th width="33%" class="text-center">가격</th>
		</tr>
		</thead>
		<tbody>
	<%
		OrderDAO order = new OrderDAO();
		ArrayList<Orderdetail> list = order.getList(ORDER_NO);
		for(int i=0;i<list.size();i++){
			ProductDAO product = new ProductDAO();
			Product pro = product.getproduct(list.get(i).getPRODUCT_NO());
			String f = df.format(pro.getPRODUCT_PRICE());
	%>
		<tr>
		<th width="33%" class="text-center"><%=pro.getPRODUCT_NAME() %></a></th>
		<th width="33%" class="text-center"><%=list.get(i).getORDER_COUNT() %></th>
		<th width="33%" class="text-center"><%=f %></th>
	</tr>
	<%} %>
	</tbody>
	</table>
	<br>
	<div style="float:right">
	<input type="button" value="돌아가기" onclick="history.go(-1)" class="btn-lg btn-primary">
	</div>	
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>