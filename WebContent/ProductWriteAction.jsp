<%@page import="java.io.PrintWriter"%>
<%@page import="product.ProductDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	
	request.setCharacterEncoding("utf-8");
	
	String fileSave= "/fileSave";
		
	String real = application.getRealPath(fileSave);
	
	int max = 1024*1024*10;
	MultipartRequest multi = new MultipartRequest(request, real, max, "utf-8", new DefaultFileRenamePolicy());
	
	String name = multi.getParameter("name");
	String model = multi.getParameter("model");
	int price = Integer.parseInt(multi.getParameter("price"));
	int stock = Integer.parseInt(multi.getParameter("stock"));
	String content = multi.getParameter("content");
	
	String image = multi.getOriginalFileName("image");
	
	ProductDAO product = new ProductDAO();
	int result = product.write(name,model,price,stock,content,image);
	
	if(result==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 사용중인 파일 이름입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else if(result==-1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글쓰기에 실패했습니다')");
		script.println("history.back()");
		script.println("</script>");
	} else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='Main.jsp'");		
		script.println("</script>");
	}
%>
</body>
</html>