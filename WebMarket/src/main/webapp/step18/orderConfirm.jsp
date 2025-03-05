<%@page import="java.net.URLDecoder"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
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
  <%
  
	request.setCharacterEncoding("UTF-8");
  
  	Cookie[] cookies = request.getCookies();
  	String cartId = session.getId();
  	
  	String shipping_cartId="";
  	String shipping_name="";
  	String shipping_date="";
  	String shipping_country="";
  	String shipping_zipCode="";
  	String shipping_address="";
  	
  	if(cookies != null){
  		for(int i=0; i<cookies.length; i++){
  			Cookie thisCookie = cookies[i];
  			String n =thisCookie.getName();
  			
  			if(n.equals("Shipping_cartId")){
  				shipping_cartId = thisCookie.getValue();
  			}
  			if(n.equals("Shipping_name")){
  				shipping_name = thisCookie.getValue();
  			}
  			if(n.equals("Shipping_date")){
  				shipping_date = thisCookie.getValue();
  			}
  			if(n.equals("Shipping_country")){
  				shipping_country = thisCookie.getValue();
  			}
  			if(n.equals("Shipping_zipCode")){
  				shipping_zipCode = thisCookie.getValue();
  			}
  			if(n.equals("Shipping_address")){
  				shipping_address = URLDecoder.decode(thisCookie.getValue());
  			}
  		}
  	}
  %>
   <%@ include file="/menu.jsp" %>
   
   <div class="jumbotron">
	 <div class="container">
	 <h1 class="display-3">
	 	주문 정보
	 </h1>
	 </div>
   </div>
   <div class="container">
   	<div class="row">
   		<div class="col-12">
   			<h1>영수증</h1>
   		</div>
   	</div>
   	<div class="row">
   		<div class="col-4">
   			<strong>배송 주소</strong><br />
   			성명 : <% out.println(shipping_name); %> <br />
   			우편번호 : <% out.println(shipping_zipCode); %> <br />
   			주소 : <% out.println(shipping_address); %>(<% out.println(shipping_country); %>) <br />
   		</div>
   		<div class="col-4" align="right">
   			<em>배송일 : <% out.println(shipping_date); %></em>
   		</div>
   	</div>
   	<div class="row">
   		<div class="col">
   			<table class="table">
   				<tr>
   					<th>제품명</th>
   					<th></th>
   					<th>가격</th>
   					<th>소계</th>
   				</tr>
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
   					<td><%=product.getPname() %></td>
   					<td><%=product.getQuantity()%></td>
   					<td><%=df.format(product.getUnitPrice())%></td>
   					<td><%=df.format(total) %>원</td>
   				</tr>
   				<%
			  		}
   				%>
   				<tr>
			      <td></td>
			      <td>총액</td>
			      <td class="text-right"><%=df.format(sum) %></td>
			      <td></td>
			    </tr>
   			</table>
   		</div>
   	</div>
   	<div class="row">
   		<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId %>" class="btn btn-warning">이전</a>
   		<a href="./thankCustomer.jsp" class="btn btn-warning">주문완료</a>
   		<a href="./checkOutCancelled.jsp" class="btn btn-warning">취소</a>
   	</div>
   </div>

	
	
   <%@ include file="/footer.jsp" %>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    
  </body>
</html>