<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
			
		String realFolder = application.getRealPath("/resources/images/");
		String encType="utf-8";
		int maxsize = 5*1024*1024;
		
		MultipartRequest multi = new MultipartRequest(request,realFolder, maxsize,encType, new DefaultFileRenamePolicy());
		
		String productId = multi.getParameter("productId");
		String name = multi.getParameter("name");
		String unitPrice = multi.getParameter("unitPrice");
		String description = multi.getParameter("description");
		String menufacturer = multi.getParameter("menufacturer");
		String category = multi.getParameter("category");
		String unitsInStock = multi.getParameter("unitsInStock");
		String condition = multi.getParameter("condition");
		
		//가격 정보가 없으면 0으로, 가격을 입력시에는 정수로 변환
		int price;
		if(unitPrice.isEmpty()) price=0;
		else price = Integer.valueOf(unitPrice);
		
		long stock;
		if(unitsInStock.isEmpty()) stock =0 ;
		else stock = Long.valueOf(unitsInStock);
		
		Enumeration files = multi.getFileNames();
		String fname = (String)files.nextElement();
		String filename = multi.getFilesystemName(fname);
		
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
		newProduct.setFilename(filename);
	
		dao.addProduct(newProduct);
		
		response.sendRedirect("products.jsp");
	%>
</body>
</html>










