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

    <title>addMemeber.jsp</title>
  </head>
  <body>
  	<script>
  		function checkForm(){
  			if(!document.newWrite.name.value){
  				alert("성명을 입력해주세요")
  				return false
  			}
  			if(!document.newWrite.title.value){
  				alert("제목을 입력해주세요")
  				return false
  			}
  			if(!document.newWrite.contents.value){
  				alert("내용을 입력해주세요")
  				return false
  			}
  		}
  	</script>
   <%@ include file="/menu.jsp" %>
   	  <div class="jumbotron">
		 <div class="container">
			 <h1 class="display-3">
			 	게시판
			 </h1>
		 </div>
     </div>
     <%
     	String name = (String)request.getAttribute("name");
     %>
     <!-- 본문내용 -->
     <div class="container">
     	 <div class="row">
     	 	<div class="col">
     	 		<form action="./BoardWriteAction.do" method="post" name="newWrite" onsubmit="return checkForm()">
     	 		  <input type="hidden" value="${sessionId }" name="id"/>	
     	 		  <div class="form-group">
				    <label for="name">성명</label>
				    <input type="text" class="form-control" name="name" id="name" value="<%=name %>" readonly>
				  </div>
				  <div class="form-group">
				    <label for="title">제목</label>
				    <input type="text" class="form-control" name="title" placeholder="제목" id="title">
				  </div>
				  <div class="form-group">
				    <label for="contents">내용</label>
				    <textarea name="contents" id="contents" cols="30" rows="10" class="form-control"></textarea>
				  </div>
				  <div class="form-group">
				  	<input type="submit" class="btn btn-info" value='게시글 등록'>
				  	<input type="reset" class="btn btn-danger" value='취소'>
				  	<input type="button" class="btn btn-success" value='이전' onclick="history.back()"/>
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









