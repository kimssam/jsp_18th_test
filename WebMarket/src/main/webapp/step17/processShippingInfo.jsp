<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>processShippingInfo</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	Cookie cartId = new Cookie("Shipping_cartId",request.getParameter("cartId"));
	Cookie name = new Cookie("Shipping_name",request.getParameter("name"));
	Cookie date = new Cookie("Shipping_date",request.getParameter("date"));
	Cookie country = new Cookie("Shipping_country",request.getParameter("country"));
	Cookie zipCode = new Cookie("Shipping_zipCode",request.getParameter("zipCode"));
	Cookie shippingAddress = new Cookie("Shipping_address",URLEncoder.encode(request.getParameter("address")));
	
	cartId.setMaxAge(24*60*60);
	name.setMaxAge(24*60*60);
	date.setMaxAge(24*60*60);
	country.setMaxAge(24*60*60);
	zipCode.setMaxAge(24*60*60);
	shippingAddress.setMaxAge(24*60*60);
	
	response.addCookie(cartId);
	response.addCookie(name);
	response.addCookie(date);
	response.addCookie(country);
	response.addCookie(zipCode);
	response.addCookie(shippingAddress);
	
	response.sendRedirect("orderConfirm.jsp");
%>
</body>
</html>




