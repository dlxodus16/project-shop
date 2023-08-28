<%@page import="order.Order"%>
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
</head>
<link rel="stylesheet" href="css/bootstrap.css">
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
		<h1>판매상황 화면</h1>
</div>
<br><br>
<div class="container">
	<table class="table table-striped">
	<thead>
		<tr>
			<th width="33%" class="text-center">구매자</th>
			<th width="33%" class="text-center">구매일</th>
			<th width="33%" class="text-center">총 가격</th>
		</tr>
	</thead>
		<tbody>
	<%
		OrderDAO order = new OrderDAO();
		ArrayList<Order> list = order.getList();
		for(int i=0;i<list.size();i++){
			String f = df.format(list.get(i).getORDER_PRICE());
	%>
		<tr>
		<th width="33%" class="text-center"><a href="SellListDetail.jsp?ORDER_NO=<%=list.get(i).getORDER_NO()%>"><%=list.get(i).getMEMBER_ID() %></a></th>
		<th width="33%" class="text-center"><%=list.get(i).getORDER_DATE() %></th>
		<th width="33%" class="text-center"><%=f %></th>
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