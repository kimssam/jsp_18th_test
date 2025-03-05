<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<title>resultMemeber</title>
</head>
<body>
	<%@ include file="/menu.jsp"%>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 정보</h1>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col">
				<%
					String msg = request.getParameter("msg");
					
					if(msg != null){
						
						if(msg.equals("1")) {
							out.println("<h2 class='alert alert-danger'>회원가입을 축하드립니다. 다시 로그인해 주세요</h2>");
						}else if(msg.equals("2")){
						String loginId = (String)session.getAttribute("sessionId");
						out.println("<h2 class='alert alert-danger'>"+loginId+"님 환영합니다.</h2>");
						}else if(msg.equals("0")){
							out.println("<h2 class='alert alert-danger'>회원정보가 수정되었습니다.</h2>");
						}
					}else{
							out.println("<h2 class='alert alert-danger'>회원정보가 없습니다.</h2>");
					}
				%>
			</div>
		</div>
	</div>


	<%@ include file="/footer.jsp"%>

	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>

</body>
</html>