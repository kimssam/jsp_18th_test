<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>test</title>
  </head>
  <body>
   <%@ include file="/menu.jsp" %>
   
   <%! 
	String greeting = "Welcome to Web Shopping Mall"; 
	String tagline = "지마켓에 오신 것을 환영합니다.";	
	%>
	<div class="text-center">
		<div class="jumbotron">
			<h1><%=greeting %></h1>
			<h3><%=tagline %></h3>
		</div>
		<p class="text-right mr-5">
			<%
				response.setIntHeader("Refresh", 1);
				Date day = new Date();
				String apm;
				int hour = day.getHours();
				int minute = day.getMinutes();
				int second = day.getSeconds();
				if(hour/12 == 0){
					apm="AM";
				}else{
					apm="PM";
					hour -= 12;
				}
				String ct = hour+" : "+minute+" : "+second+" "+apm;
				out.println("현재 접속 시각 : "+ct+"\n");
			%>
		</p>
	</div>
	
	
	<%@ include file="/footer.jsp" %>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    
  </body>
</html>