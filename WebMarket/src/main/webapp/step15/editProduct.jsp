<%@page import="dao.ProductRepository"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
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

    <title>해당 제목</title>
    <script>
    	function deleteConfirm(id){
    		if(confirm("해당 상품을 정말 삭제하시겠습니까?") == true){
    			location.href="./deleteProduct.jsp?id="+id;
    		}else{
    			return false;
    		}
    	}
    </script>
  </head>
  <body>
   <%@ include file="menu.jsp" %>
   
   <div class="jumbotron">
   		<div class="container">
   			<h1 class="display-3">상품편집</h1>
   		</div>
   </div>
   
   <div class="container">
   		<div class="row">
   		<%@ include file="dbconn.jsp" %>
   		<%
   			String sql = "select * from product";
   			pstmt = conn.prepareStatement(sql);
   			rs = pstmt.executeQuery();
   			while(rs.next()){
   				
   		%>
   		<div class="col-md-4">
   			<img src="../resources/images/<%=rs.getString("p_filename") %>" alt="" class="img-fluid"/>
   			<h3><%=rs.getString("p_name") %></h3>
   			<p><%=rs.getString("p_description") %></p>
   			<%
					DecimalFormat formatter = new DecimalFormat("#,###");
			%>
			<h4><%=formatter.format(rs.getInt("p_unitPrice"))  %>원</h4>
   			<p>
   				<%
   					String edit = request.getParameter("edit");
   					if(edit.equals("update")){
   				%>
   					<a href="./updateProduct.jsp?id=<%=rs.getString("p_id") %>" class="btn btn-success">수정 &raquo;</a>
   				<%		
   					}else if(edit.equals("delete")){
   				%>
   					<a href="#" class="btn btn-danger" onclick="deleteConfirm('<%=rs.getString("p_id") %>')">삭제 &raquo;</a>
   				<%
   						
   					}
   				%>
   			</p>
   		</div>
   		<%
   			} //반복문 닫기
   			if(rs != null) rs.close();
   			if(pstmt != null) pstmt.close();
   			if(conn != null) conn.close();
   		%>
   		</div>
   </div>
	
   <%@ include file="footer.jsp" %>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    
  </body>
</html>