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
<br>
<div class="container theme-showcase" align="center">
	<h1>상품등록 화면</h1>
	<br><br>
</div>
<div class="container">
	<form action="ProductWriteAction.jsp" method="post" enctype="multipart/form-data">
		상품명<input type="text" name="name" class="form-control" placeholder="상품명을 입력해주세요." required autofocus><br>
		모델명<input type="text" name="model" class="form-control" placeholder="모델명을 입력해주세요." required><br>
		가격<input type="number" name="price" class="form-control" placeholder="가격을 입력해주세요." required><br>
		재고 수<input type="number" name="stock" class="form-control" placeholder="재고 수를 입력해주세요." required><br>
		상세 설명<textarea name="content" class="form-control" placeholder="내용을 입력해주세요."maxlength="2048" style="height: 200px;"required></textarea><br>
		<input type="file" name="image">
		<button class="btn btn-sm btn-info pull-right" type="submit">등록</button>
	</form>
	<button type="button" class="btn btn-sm btn-info pull-right" onclick="location.href='Main.jsp'">취소</button>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>