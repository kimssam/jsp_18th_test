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

    <title>template.jsp</title>
  </head>
  <body>
   <%@ include file="/menu.jsp" %>
   
   <div class="jumbotron">
	 <div class="container">
	 <h1 class="display-3">
	 	배송 정보
	 </h1>
	 </div>
   </div>
   <div class="container">
   	<div class="row">
   		<div class="col-12">
   			<form action="./processShippingInfo.jsp" method="post">
   			  <input type="hidden" name="cartId" value='<%=request.getParameter("cartId")%>'/> 	
			  <div class="form-group">
			    <label for="name">이름</label>
			    <input type="text" class="form-control" id="name" name="name">
			  </div>
			  <div class="form-group">
			    <label for="date">배송일</label>
			    <input type="text" class="form-control" id="date" name="date" placeholder="yyyy/mm/dd">
			   </div>
			   <div class="form-group">
			    <label for="country">국가명</label>
			    <input type="text" class="form-control" id="country" name="country">
			   </div>
			   <div class="form-group">
			    <label for="zipCode">우편번호</label>
			    <input type="text" class="form-control" id="zipCode" name="zipCode">
			   </div>
			   <div class="form-group">
			    <label for="address">주소</label>
			    <input type="text" class="form-control" id="address" name="address">
			   </div>
			  
			  
			  <input type="submit" class="btn btn-primary" value="등록">
			  <a href="./cart.jsp?cartId=<%=request.getParameter("cartId") %>" class="btn btn-info">이전</a>
			  <a href="./checkOutCancelled.jsp" class="btn btn-warning">취소</a>
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