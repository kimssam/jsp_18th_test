<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
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
   <%
   	String cartId = session.getId();
   %>
   <div class="jumbotron">
	 <div class="container">
	 <h1 class="display-3">
	 	장바구니
	 </h1>
	 </div>
   </div>
   <div class="container">
   <div class="row">
   	<div class="col text-right mb-3">
   		<a href="./deleteCart.jsp?cartId=<%=cartId %>" class="btn btn-danger">장바구니 삭제하기</a>
   		<a href="./shippingInfo.jsp?cartId=<%=cartId %>" class="btn btn-info">주문하기</a>
   	</div>
   </div>
   	<div class="row">
   		<div class="col">
   			<table class="table table-striped">
			  <thead>
			    <tr>
			      <th scope="col">상품</th>
			      <th scope="col">가격</th>
			      <th scope="col">수량</th>
			      <th scope="col">소계</th>
			      <th scope="col">비고</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<%
			  		DecimalFormat df = new DecimalFormat("#,###");
			  		int sum = 0; //장바구니에 담긴 모든 제품 가격의 총합
			  		ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
			  		if(cartList == null){
			  			cartList = new ArrayList<Product>();
			  		}
			  		
			  		for(int i=0; i<cartList.size(); i++){
			  			Product product = cartList.get(i);
			  			int total = product.getUnitPrice() * product.getQuantity();
			  			//해당 제품의 총합
			  			sum = sum + total;
			  		
			  	%>
			    <tr>
			      <th scope="row"> <%=product.getProductId() %> - <%=product.getPname() %> </th>
			      <td class="text-right"><%=df.format(product.getUnitPrice())%></td>
			      <td><%=df.format(product.getQuantity())%></td>
			      <td class="text-right"><%=df.format(total) %></td>
			      <td><a href="./removeCart.jsp?id=<%=product.getProductId() %>" class="badge badge-danger">삭제</a></td>
			    </tr>
			    <%
			  		}
			    %>
			    <tr>
			      <th scope="row"></th>
			      <td></td>
			      <td>총액</td>
			      <td class="text-right"><%=df.format(sum) %></td>
			      <td></td>
			    </tr>
			  </tbody>
			</table>
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