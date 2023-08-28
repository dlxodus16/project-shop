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
.login {list-style: none; display:inline; float:right; margin:8px;}
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
%>
<br>
<div class="container theme-showcase" align="center">
	<h1>쇼핑몰 메인</h1>
<%
	if(userID==null){
%>
	<ul>
		<li class="login"><a href="Signup.jsp">회원가입</a></li>
		<li class="login"><a href="Login.jsp">로그인</a></li>
	</ul>
<%
	} else if (userID.equals("admin")){
%>
	<ul>
		<li class=login><a href="LogoutAction.jsp">로그아웃</a></li>
		<li class=login><a href="SellList.jsp">판매상황</a></li>
		<li class=login><a href="Inventory.jsp">재고관리</a></li>	
		<li class=login><a href="ProductWrite.jsp">상품등록</a></li>			
	</ul>	
<%
	} else {
%>
	<ul>
		<li class=login><a href="LogoutAction.jsp">로그아웃</a></li>
		<li class=login><a href="BuyList.jsp">구매내역</a></li>
		<li class=login><a href="viewBasket.jsp">장바구니</a></li>
		<li class=login><strong><%=userID %>님</strong></li>		
	</ul>	
<%
	}
%>
</div>
<br><br><br><br><br>
<div class="container">
	<table border="1" >
		<%
			ProductDAO product = new ProductDAO();
			ArrayList<Product> list = product.getList();
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

</div>
<br><br>
<div class="container" align="right">
	<form action="Search.jsp">
            <input type="text" size="20" name="searchName" required/>
            <input type="submit" value="검색" class="btn btn-sm btn-default"/>
        </form>    
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>