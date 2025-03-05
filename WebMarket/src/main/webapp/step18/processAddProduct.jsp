<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="dbconn.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
		
		String sql="insert into product values(?, ?, ?, ?, ?, ?, ?, ?,  ?, 0 )";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, productId);
		pstmt.setString(2,name);
		pstmt.setInt(3,price);
		pstmt.setString(4,description);
		pstmt.setString(5,menufacturer);
		pstmt.setString(6, category);
		pstmt.setLong(7,stock);
		pstmt.setString(8,condition);
		pstmt.setString(9,filename);
	
		pstmt.executeUpdate();
		
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		
		response.sendRedirect("products.jsp");
	%>
</body>
</html>










