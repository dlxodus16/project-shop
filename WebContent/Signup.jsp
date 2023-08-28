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
	.container {
  padding-right: 200px;
  padding-left: 200px;
  margin-right: auto;
  margin-left: auto;
}
</style>
</head>
<body>
<div class="container">
<div class="col-lg-4"></div>
	<div class="jumbotron" style="padding-top: 20px;">
	<form method="post">
	<br>
		아이디<input type="text" name="id" class="form-control" placeholder="아이디" required autofocus><br>	
		<input type="submit" value="중복확인" class="btn btn-sm btn-info pull-right" onclick="javascript: form.action='Doublecheck.jsp'"><br>
		비밀번호<input type="password" name="pw" class="form-control" placeholder="비밀번호" required> <br>
		비밀번호 확인<input type="password" name="pwcheck" class="form-control" placeholder="비밀번호 확인" required> <br>
		이름<input type="text" name="name" class="form-control" placeholder="이름" required> <br><br>
		<input type="submit" value="회원가입" class="btn btn-primary form-control" onclick="javascript: form.action='SignupAction.jsp'">
	</form>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>