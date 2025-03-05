<%@page import="dao.ProductRepository"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page errorPage="exceptionNoProduct.jsp" %>    
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>product.jsp</title>
  </head>
  <body>
 <%@ include file="menu.jsp" %>
  <div class="jumbotron">
 <div class="container">
 <h1 class="display-3">상품 정보</h1>
 </div>
 </div>
 <%
	 String id = request.getParameter("id");
 	 ProductRepository dao = ProductRepository.getInstance();
	 Product product = dao.getProductById(id);
 %>

	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="../resources/images/<%=product.getFilename() %>" alt="" class="img-fluid"/>
			</div>
			<div class="col-md-6">
				<h3><%=product.getPname()%></h3>
				<p><%=product.getDescription()%></p>
				<p>
					상품코드 :
					<span class="badge badge-danger"><%=product.getProductId()%></span></p>
				<p>
					제조사 :
					<%=product.getMenufacturer()%></p>
				<p>
					분류 :
					<%=product.getCategory()%></p>
				<p>
					재고수 :
					<%=product.getUnitsInStock()%></p>
				<%
					DecimalFormat formatter = new DecimalFormat("#,###");
				%>
				<h3><%=formatter.format(product.getUnitPrice())  %>원</h3>
				<p>
					<form action="./addCart.jsp?id=<%=product.getProductId() %>" name="addForm" method="post">
						<a href="#" class="btn btn-info" onclick="addToCart()">상품 주문 &raquo;</a>
						<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
						<a href="./products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
					</form>
				</p>
			</div>
		</div>
	</div>




	<%@ include file="footer.jsp" %>


    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
	<script>
	function addToCart(){
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		}else{
			document.addForm.reset();
		}
	}
	</script>
   
  </body>
</html>






