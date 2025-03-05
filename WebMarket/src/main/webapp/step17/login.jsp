<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>login.jsp</title>
  </head>
  <body>
   <%@ include file="/menu.jsp" %>
   
   <div class="jumbotron">
	 <div class="container">
	 <h1 class="display-3">
	 	로그인
	 </h1>
	 </div>
   </div>
   
   <div class="container">
   	<div class="row">
   		<div class="col-md-4">
   			<h1>로그인해주세요</h1>
   			<%
   				String error = request.getParameter("error");
   				if(error != null){
   					out.println("<div class='alert alert-danger'>");
   					out.println("아이디와 비밀번호를 확인해주세요");
   					out.println("</div>");
   				}
   			%>
   			<form action="j_security_check" method="post">
			  <div class="form-group">
			    <label for="exampleInputEmail1">아이디</label>
			    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="j_username">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">비밀번호</label>
			    <input type="password" class="form-control" id="exampleInputPassword1" name="j_password">
			  </div>
			  <button type="submit" class="btn btn-info">로그인</button>
			</form>
   		</div>
   	</div>
   </div>
	
	
   <%@ include file="/footer.jsp" %>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    
  </body>
</html>