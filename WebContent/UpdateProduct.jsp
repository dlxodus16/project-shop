<%@page import="product.Product"%>
<%@page import="product.ProductDAO"%>
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
  margin-left: 15px;
}
</style>
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
		PRODUCT_NO = Integer.parseInt(request.getParameter("PRODUCT_NO"));
	}
	if (PRODUCT_NO == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글 입니다.')");
		script.println("location.href = 'Main.jsp'");
		script.println("</script>");
	}
	Product product = new ProductDAO().getproduct(PRODUCT_NO);
%>
<br>
<div class="container theme-showcase" align="center">
	<h1>글 수정 화면</h1>
	<br><br>
</div>
<div class="container">
	<form method="post" action="UpdateAction.jsp?PRODUCT_NO=<%=PRODUCT_NO%>" enctype="multipart/form-data">
		상품명<input type="text" name="name" class="form-control" placeholder="상품명을 입력해주세요." value="<%=product.getPRODUCT_NAME()%>" required autofocus><br>
		모델명<input type="text" name="model" class="form-control" placeholder="모델명을 입력해주세요." value="<%=product.getPRODUCT_MODEL()%>" required><br>
		가격<input type="number" name="price" class="form-control" placeholder="가격을 입력해주세요." value="<%=product.getPRODUCT_PRICE()%>"required><br>
		재고 수<input type="number" name="stock" class="form-control" placeholder="재고 수를 입력해주세요." value="<%=product.getPRODUCT_STOCK()%>"required><br>
		상세 설명<textarea name="content" class="form-control" placeholder="내용을 입력해주세요."maxlength="2048" style="height: 200px;"required><%=product.getPRODUCT_CONTENT() %></textarea><br>
		<input type="file" name="image">
		<button class="btn btn-sm btn-info pull-right" type="submit">수정</button>
	</form>
	<button type="button" class="btn btn-sm btn-info pull-right" onclick="location.href='Main.jsp'">취소</button>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>