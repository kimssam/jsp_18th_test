<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteCart</title>
</head>
<body>
	<%
		String id = request.getParameter("cartId");
		if(id == null){
			response.sendRedirect("cart.jsp");
			return;
		}
		session.invalidate();
		response.sendRedirect("cart.jsp");
	%>
</body>
</html>