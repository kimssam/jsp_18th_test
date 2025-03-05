<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>addProduct.jsp</title>
  </head>
  <body>
   <%@ include file="menu.jsp" %>
   <div class="jumbotron">
	 <div class="container">
	 <h1 class="display-3">상품 등록</h1>
	 </div>
   </div>
   
   <div class="container">
   		<div class="row">
   			<div class="col-12">
   				<form action="./processAddProduct.jsp" method="post" enctype="multipart/form-data" name="newProduct">
				  <div class="form-group">
				    <label for="productCode">상품 코드</label>
				    <input type="text" class="form-control" id="productCode" name="productId">
				  </div>
				  <div class="form-group">
				    <label for="name">상품명</label>
				    <input type="text" class="form-control" id="name" name="name">
				  </div>
				  <div class="form-group">
				    <label for="unitPrice">가격</label>
				    <input type="text" class="form-control" id="unitPrice" name="unitPrice">
				  </div>
				  <div class="form-group">
				    <label for="description">상세 정보</label>
				    <textarea name="description" class="form-control" id="description" rows="10"></textarea>
  				  </div>
				  <div class="form-group">
				    <label for="menufacturer">제조사</label>
				    <input type="text" class="form-control" id="menufacturer" name="menufacturer">
				  </div>
				  <div class="form-group">
				    <label for="category">분류</label>
				    <input type="text" class="form-control" id="category" name="category">
				  </div>
				  <div class="form-group">
				    <label for="unitsInStock">재고 수</label>
				    <input type="text" class="form-control" id="unitsInStock" name="unitsInStock">
				  </div>
				  <div class="form-group">
				    <label for="condition">상태</label><br />
				    
				    <div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="condition" id="condition1" value="new">
					  <label class="form-check-label" for="condition1">신규 제품</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="condition" id="condition2" value="old">
					  <label class="form-check-label" for="condition2">중고 상품</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="condition" id="condition3" value="recycling">
					  <label class="form-check-label" for="condition3">리퍼 제품</label>
					</div>
				  </div>
				  <!-- 이미지 등록 버튼 추가 -->
				  <div class="form-group">
				    <label for="productImage">이미지 등록</label>
				    <input type="file" class="form-control" id="productImage" name="productImage">
				  </div>
				  
				  <div class="form-group">
				  	<input type="button" class="btn btn-info btn-block" value="등록" onclick="checkAddProduct()">
				  </div>
				</form>
				</div>
				<!-- col -->
   			</div>
   			<!-- row -->
   </div>
   <!-- container -->
   
	
	
   <%@ include file="footer.jsp" %>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <script src="../resources/js/validation.js?v=2"></script>
  </body>
</html>












