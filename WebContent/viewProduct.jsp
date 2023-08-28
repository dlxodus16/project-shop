<%@page import="java.text.DecimalFormat"%>
<%@page import="comment.Comment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="comment.CommentDAO"%>
<%@page import="product.ProductDAO"%>
<%@page import="product.Product"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<style>
	.pull-right {
  	float: right !important;
  	margin-left: 10px;
}
	
</style>
</head>
<body>
<br>
<div class="container theme-showcase" align="center">
	<h1>상품 보기 화면</h1>
	<br><br>
</div>
<%
	DecimalFormat df = new DecimalFormat("###,###");
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
	if (PRODUCT_NO == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글 입니다.')");
		script.println("location.href = 'Main.jsp'");
		script.println("</script>");
	}
	Product product = new ProductDAO().getproduct(PRODUCT_NO);
	int price = product.getPRODUCT_PRICE();
	String f = df.format(price);
%>
<div class="container">		
	<img src="fileSave/<%=product.getPRODUCT_IMAGE() %>" align="left" width="40%"><br>
	<font size="6em"><strong>상품명:<%=product.getPRODUCT_NAME() %>
	<%if(product.getPRODUCT_STOCK()==0){ %>
			<a style="color:red">[품절]</a>
			<%} %></strong></font><br>
	<font size="4em">[<%=product.getPRODUCT_MODEL() %>]<br></font><br><br><br><br>
	<form method="post">
	<font size="5em">수량 <input type="number" name="num" value="1" required></font><br>
	<font size="5em">가격: <%=f %></font><br><br>
	<a href="Main.jsp" class="btn-lg btn-primary">목록</a>
	<%if(userID!=null && userID.equals("admin")){ %>
	<a href="UpdateProduct.jsp?PRODUCT_NO=<%=PRODUCT_NO%>" class="btn-lg btn-primary">수정</a>
	<a onclick="return confirm('정말로 삭제하시겠습니가?')" href="DeleteProduct.jsp?PRODUCT_NO=<%=PRODUCT_NO%>" class="btn-lg btn-primary">삭제</a>
	<%}else if(userID!=null){%>
	<input type="submit" class="btn-lg btn-primary" value="장바구니" onclick="javascript: form.action='BasketAction.jsp?PRODUCT_NO=<%=PRODUCT_NO%>&MEMBER_ID=<%=userID%>'">
	<input type="submit" class="btn-lg btn-primary" value="구매" onclick="javascript: form.action='BuyProductDirect.jsp?PRODUCT_NO=<%=PRODUCT_NO%>&ORDER_PRICE=<%=product.getPRODUCT_PRICE()%>'">
	<%} %>
	</form>
		<table class="table">
		<tbody>
			<tr>
				<td style="width:20%;">상세정보</td>
			</tr>
			<tr>
				<td colspan="2" style="min-height:200px;text-align:left;"><%=product.getPRODUCT_CONTENT() %></td>
			</tr>
		</tbody>
	</table>
	<hr>
	댓글
	<%
		CommentDAO comment = new CommentDAO();
		ArrayList<Comment> list = comment.getList(PRODUCT_NO);
		for(int i=0;i<list.size();i++){
	%>
	<table class="table">
		<tbody>
			<tr>
				<td style="width:20%;"><%=list.get(i).getMEMBER_ID()%></td>
				<td colspan="2"><%=list.get(i).getCOMMENT_CONTENT() %></td>	
				</tr>
				<tr>
				<td></td>
				<td>	
				<%
					if(userID!=null && userID.equals(list.get(i).getMEMBER_ID())) {
				%>
				<a onclick="return confirm('정말로 삭제하시겠습니가?')" href="DeleteComment.jsp?COMMENT_NO=<%=list.get(i).getCOMMENT_NO()%>" class="btn btn-sm btn-primary pull-right">삭제</a>
				<a href="UpdateComment.jsp?COMMENT_NO=<%=list.get(i).getCOMMENT_NO()%>" class="btn btn-sm btn-primary pull-right">수정</a>
				<%
					} 
				if (userID!=null && userID.equals("admin")) {
				%>
				<a onclick="return confirm('정말로 삭제하시겠습니가?')" href="DeleteComment.jsp?COMMENT_NO=<%=list.get(i).getCOMMENT_NO()%>" class="btn btn-sm btn-primary pull-right">삭제</a>
				<%
					}
				%>
				</td>	
			</tr>							
	<%
		}
	%>		
		</tbody>
	</table>
	<hr>
	<%
		if(userID!=null && !userID.equals("admin")){
	%>
	<form action="CommentAction.jsp?PRODUCT_NO=<%=PRODUCT_NO%>" method="post">
	댓글 작성<textarea name="content" class="form-control" placeholder="내용을 입력해주세요."maxlength="512" style="height: 100px;"required></textarea><br>
	<button class="btn btn-sm btn-info pull-right" type="submit">댓글 등록</button>
	</form>
	<%
		}
	%>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>