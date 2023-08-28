<%@page import="java.text.DecimalFormat"%>
<%@page import="product.Product"%>
<%@page import="product.ProductDAO"%>
<%@page import="basket.Basket"%>
<%@page import="java.util.ArrayList"%>
<%@page import="basket.BasketDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<style>
	.price{float:right;font-size:25px;}
</style>
</head>
<body>
<%
	int totprice = 0;
	DecimalFormat df = new DecimalFormat("###,###");
	String userID = null;
	if(session.getAttribute("userID") != null)
	{
		userID = (String) session.getAttribute("userID");
	}
%>
<br>
<div class="container theme-showcase" align="center">
		<h1>장바구니 화면</h1>
</div>
<br><br>
<div class="container">
	<table class="table table-striped">
	<thead>
		<tr>
			<th width="30%" class="text-center">상품명</th>
			<th width="30%" class="text-center">수량</th>
			<th width="30%" class="text-center">가격</th>
			<th width="10%" class="text-center"></th>
		</tr>
	</thead>
	<tbody>
	<%
		BasketDAO basket = new BasketDAO();
		ArrayList<Basket> list = basket.getList(userID);
		for(int i=0;i<list.size();i++){
			ProductDAO product = new ProductDAO();
			Product pro = product.getproduct(list.get(i).getPRODUCT_NO());
			String f = df.format(pro.getPRODUCT_PRICE());
	%>
		<tr>
		<th width="30%" class="text-center"><%=pro.getPRODUCT_NAME() %></th>
		<th width="30%" class="text-center"><%=list.get(i).getPRODUCT_COUNT() %></th>
		<th width="30%" class="text-center"><%=f %></th>
		<th width="10%" class="text-center"><a onclick="return confirm('정말로 삭제하시겠습니가?')" href="DeleteBasket.jsp?PRODUCT_NO=<%=list.get(i).getPRODUCT_NO()%>&MEMBER_ID=<%=userID %>&PRODUCT_COUNT=<%=list.get(i).getPRODUCT_COUNT() %>" class="btn btn-sm btn-primary pull-right">삭제</a></th>
	</tr>
		<%
		totprice += list.get(i).getPRODUCT_COUNT() * pro.getPRODUCT_PRICE();
		}
		String tp = df.format(totprice);
		%>
</tbody>
	</table>
	<br>
	<p class="price"><strong>가격: <%=tp %></strong></p>
	<br><br><br><br>
	<div style="float:right">
	<a href="BuyProduct.jsp?ORDER_PRICE=<%=totprice%>" class="btn-lg btn-primary">구매하기</a>
	<a href="Main.jsp" class="btn-lg btn-primary">돌아가기</a>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>