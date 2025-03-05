<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>removeCart</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		if(id==null){
			response.sendRedirect("products.jsp");
			return;
		}
		ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductById(id);
		if(product == null){
			response.sendRedirect("exceptionNoProduct.jsp");
		}
		
		ArrayList<Product> cartList =  (ArrayList<Product>)session.getAttribute("cartlist");
		Product goodsQnt = new Product();
		for(int i=0; i<cartList.size(); i++){
			goodsQnt = cartList.get(i);
			if(goodsQnt.getProductId().equals(id)){
				cartList.remove(goodsQnt);
			}
		}
		
		response.sendRedirect("cart.jsp");
	%>
</body>
</html>







