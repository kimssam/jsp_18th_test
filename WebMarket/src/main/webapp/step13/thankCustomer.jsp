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
  	Cookie[] cookies = request.getCookies();
  
    String shipping_cartId="";
    String shipping_date="";
    
    if(cookies != null){
    	for(int i=0; i<cookies.length; i++){
    		Cookie thisCookie = cookies[i];
    		String n = thisCookie.getName();
    		if(n.equals("Shipping_cartId")){
    			shipping_cartId = thisCookie.getValue();
    		}
    		if(n.equals("Shipping_date")){
    			shipping_date = thisCookie.getValue();
    		}
    	}
    }
  %>
   <%@ include file="menu.jsp" %>
   <div class="jumbotron">
	 <div class="container">
	 <h1 class="display-3">
	 	주문 완료
	 </h1>
	 </div>
   </div>
   <div class="container">
   	<div class="row">
   		<div class="col-12">
   			<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
   			<p>주문에 <% out.println(shipping_date); %>에 배송될 예정입니다.</p>
   			<p>주문번호는 <% out.println(shipping_cartId); %>입니다.</p>
   		</div>
   	</div>
   	<div class="row">
   		<div class="col">
   			<p><a href="./products.jsp">상품목록으로 다시가기</a></p>
   		</div>
   	</div>
   </div>
   <%
   	session.invalidate();
    for(int i=0; i<cookies.length; i++){
    	Cookie thisCookie = cookies[i];
    	String n = thisCookie.getName();
    	if(n.equals("Shipping_name")){
    		thisCookie.setMaxAge(0);
    	}
    	if(n.equals("Shipping_date")){
    		thisCookie.setMaxAge(0);
    	}
    	if(n.equals("Shipping_country")){
    		thisCookie.setMaxAge(0);
    	}
    	if(n.equals("Shipping_zipCode")){
    		thisCookie.setMaxAge(0);
    	}
    	if(n.equals("Shipping_address")){
    		thisCookie.setMaxAge(0);
    	}
    	if(n.equals("Shipping_cartId")){
    		thisCookie.setMaxAge(0);
    	}
    	
    	response.addCookie(thisCookie);
    }
   	
   %>
   
	
	
   <%@ include file="footer.jsp" %>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    
  </body>
</html>