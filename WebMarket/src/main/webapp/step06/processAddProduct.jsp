<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>processAddProduct.jsp</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String productId = request.getParameter("productId");
		String name = request.getParameter("name");
		String unitPrice = request.getParameter("unitPrice");
		String description = request.getParameter("description");
		String menufacturer = request.getParameter("menufacturer");
		String category = request.getParameter("category");
		String unitsInStock = request.getParameter("unitsInStock");
		String condition = request.getParameter("condition");
		
		//가격 정보가 없으면 0으로, 가격을 입력시에는 정수로 변환
		int price;
		if(unitPrice.isEmpty()) price=0;
		else price = Integer.valueOf(unitPrice);
		
		long stock;
		if(unitsInStock.isEmpty()) stock =0 ;
		else stock = Long.valueOf(unitsInStock);
		
		ProductRepository dao = ProductRepository.getInstance();
		
		Product newProduct = new Product();
		newProduct.setProductId(productId);
		newProduct.setPname(name);
		newProduct.setUnitPrice(price);
		newProduct.setDescription(description);
		newProduct.setMenufacturer(menufacturer);
		newProduct.setCategory(category);
		newProduct.setUnitsInStock(stock);
		newProduct.setCondition(condition);
	
		dao.addProduct(newProduct);
		
		response.sendRedirect("products.jsp");
	%>
</body>
</html>










