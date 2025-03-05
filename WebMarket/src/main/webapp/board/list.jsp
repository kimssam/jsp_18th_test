<%@page import="mvc.model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>list</title>
    <%	
    	/* String sessionId = (String)session.getAttribute("sessionId"); */
    	List boardList = (List)request.getAttribute("boardlist");
    	
    	int pageNum = (Integer)request.getAttribute("pageNum");
    	int total_record = (Integer)request.getAttribute("total_record");
    	int total_page = (Integer)request.getAttribute("total_page");
    %>
  </head>
  <body>
   <%@ include file="/menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	
	<form action="<c:url value='./BoardListAction.do' />" method="post">
		<div class="container">
			<div class="text-right">
				<span class="badge badge-success">전체 <%=total_record %>건</span>
			</div>
			<table class="table table-striped">
			  <thead>
			    <tr>
			      <th>번호</th>
			      <th>제목</th>
			      <th>작성일</th>
			      <th>수정일</th>
			      <th>조회</th>
			      <th>글쓴이</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<%
			  		for(int i=0; i<boardList.size(); i++){
			  			BoardDTO boardDTO = (BoardDTO)boardList.get(i);
			  		
			  	%>
			    <tr>
			      <td><%=boardDTO.getNum() %></td>
			      <td><a href="./BoardViewAction.do?num=<%=boardDTO.getNum()%>&pageNum=<%=pageNum%>"><%=boardDTO.getTitle() %></a></td>
			      <td><%=boardDTO.getRegist_day() %></td>
			      <td><%=boardDTO.getUpdate_day() %></td>
			      <td><%=boardDTO.getHit() %></td>
			      <td><%=boardDTO.getName() %></td>
			    </tr>
			    <%
			  		}
			    %>
			  </tbody>
			</table>
		</div>
		
		<div class="container text-center my-5">
			<!-- 페이징 구조 -->
			<c:set value="<%=pageNum %>" var="pageNum"/>
			<c:forEach var="i" begin="1" end="<%=total_page %>">
				<!-- 한 번 검색후 페이징되는 부분 -->
				<c:if test="${not empty items and not empty text}">
					<a href="<c:url value='./BoardListAction.do?pageNum=${i}&items=${items }&text=${text }' />">
						<c:choose>
							<c:when test="${pageNum==i }">
								<b>[${i}]</b>
							</c:when>
							<c:otherwise>
								[${i}]
							</c:otherwise>
						</c:choose>
					</a>
				</c:if>
				<!-- 검색을 안했거나 처음 검색했을 때 페이징되는 부분 -->
				<c:if test="${empty items or empty text}">
					<a href="<c:url value='./BoardListAction.do?pageNum=${i}' />">
						<c:choose>
							<c:when test="${pageNum==i }">
								<b>[${i}]</b>
							</c:when>
							<c:otherwise>
								[${i}]
							</c:otherwise>
						</c:choose>
					</a>
				</c:if>
			</c:forEach>
		</div>
		
		<div class="container">
			<table class="table">
				<tr>
					<td>
						<select name="items">
							<c:if test="${items eq 'title'}">
								<option value="title" selected>제목에서</option>
							</c:if>
							<c:if test="${items ne 'title'}">
								<option value="title">제목에서</option>
							</c:if>
							
							<c:if test="${items eq 'contents'}">
								<option value="contents" selected>본문에서</option>
							</c:if>
							<c:if test="${items ne 'contents'}">
								<option value="contents">본문에서</option>
							</c:if>
							
							<c:if test="${items eq 'name'}">
								<option value="name" selected>글쓴이에서</option>
							</c:if>	
							<c:if test="${items ne 'name'}">
								<option value="name">글쓴이에서</option>
							</c:if>		
						</select>
						<input type="text" name="text" value="${text}"/>
						<input type="submit" class="btn btn-primary" value="검색"/>
						<a href="" class="btn btn-info">검색 초기화</a>
						
					</td>
					<td class="text-right">
						<a href="#" onclick="checkForm()" class="btn btn-danger">글쓰기</a>
					</td>
				</tr>
			</table>
		</div>
	</form>
	



	<%@ include file="/footer.jsp" %>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <script>
    	function checkForm(){
    		if(${sessionId == null}){
    			alert("로그인해 주세요")
    			location.href="./member/loginMember.jsp";
    			return false
    		}
    		location.href="./BoardWriteForm.do?id=<%=sessionId %>"
    		
    	}
    </script>
    
  </body>
</html>