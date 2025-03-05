<%@page import="mvc.model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>게시판 상세보기</title>
    <%
    	//int num = ((Integer)request.getAttribute("num")).intValue();
   		 int num = (Integer)request.getAttribute("num");
    	 int nowpage = ((Integer)request.getAttribute("pageNum")).intValue();
         BoardDTO notice = (BoardDTO)request.getAttribute("board");
    %>
  </head>
  <body>
   <%@ include file="/menu.jsp" %>
   	  <div class="jumbotron">
		 <div class="container">
			 <h1 class="display-3">
			 	게시판 상세보기
			 </h1>
		 </div>
     </div>
     <!-- 본문내용 -->
     <div class="container">
     	 <div class="row">
     	 	<div class="col">
     	 		<form action="./BoardUpdateAction.do?num=<%=notice.getNum() %>&pageNum=<%=nowpage %>" method="post" name="newUpdate">
     	 		  <c:set var="userId" value="<%=notice.getId() %>"/>
     	 		  <div class="form-group">
				    <label for="name">성명</label>
				    <input type="text" class="form-control" name="name" id="name" value="<%=notice.getName() %>" readonly>
				  </div>
				  <div class="form-group">
				    <label for="title">제목</label>
				    <c:if test="${sessionId eq userId }">
				    	<input type="text" class="form-control" name="title" placeholder="제목" id="title" value="<%=notice.getTitle()%>">
				    </c:if>
				    <c:if test="${sessionId ne userId }">
				    	<input type="text" class="form-control" name="title" placeholder="제목" id="title" value="<%=notice.getTitle()%>" readonly>
				    </c:if>
				  </div>
				  
				  <div class="form-group">
				    <label for="contents">내용</label>
				    <c:if test="${sessionId eq userId }">
				    	<textarea name="contents" id="contents" cols="30" rows="10" class="form-control"><%=notice.getContents()%></textarea>
				    </c:if>
				    <c:if test="${sessionId ne userId }">
				    	<textarea name="contents" id="contents" cols="30" rows="10" class="form-control" readonly><%=notice.getContents()%></textarea>
				    </c:if>
				  </div>
				  <div class="form-group">
				  	
				  	<c:if test="${sessionId eq userId }">
				  		<input type="submit" class="btn btn-info" value='게시글 수정'>
				  		<a href="./BoardDeleteAction.do?num=<%=notice.getNum() %>&pageNum=<%=nowpage %>" class="btn btn-danger">게시글 삭제</a>
				  	</c:if>
				  	<a href="./BoardListAction.do?pageNum=<%=nowpage %>" class="btn btn-warning float-right">목록</a>
				  </div>
				</form>
     	 	</div>
     	 </div>
     </div>
   
	
	
   <%@ include file="/footer.jsp" %>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    
    
  </body>
</html>









