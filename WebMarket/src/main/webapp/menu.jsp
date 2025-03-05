<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=utf-8" %>

<%
	String sessionId = (String)session.getAttribute("sessionId");
%>
<nav class="navbar navbar-expand-md navbar-light bg-light">
	  <a class="navbar-brand" href="#">Navbar</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    	
	    <ul class="navbar-nav mr-auto">	
			 <li class="nav-item active">
			     <a class="nav-link" href='<c:url value="/step18/products.jsp"/>'>상품목록 <span class="sr-only">(current)</span></a>
			 </li>
			 <c:choose>
	    	   <c:when test="${sessionId eq 'admin'}"> 
			      <li class="nav-item">
			      
			        <a class="nav-link" href='<c:url value="/step18/addProduct.jsp"/>'>상품등록</a>
			      </li>
			      <li class="nav-item">
			      
			        <a class="nav-link" href='<c:url value="/step18/editProduct.jsp?edit=update"/>'>상품수정</a>
			      </li>
			      <li class="nav-item">
			      
			        <a class="nav-link" href='<c:url value="/step18/editProduct.jsp?edit=delete"/>'>상품삭제</a>
			      </li>
	      	 </c:when>
	      	</c:choose>
	      	<li class="nav-item active">
			     <a class="nav-link" href='<c:url value="/BoardListAction.do?pageNum=1"/>'>게시판 <span class="sr-only">(current)</span></a>
			</li>
	    </ul>
	    
	    <ul class="navbar-nav ml-auto">
	    	<c:choose>
	    		<c:when test="${empty sessionId }">
	    			<li class="nav-item">
				        <a class="nav-link" href='<c:url value="/member/loginMember.jsp"/>'>로그인</a>
				    </li>
	    			<li class="nav-item">
				        <a class="nav-link" href='<c:url value="/member/addMember.jsp"/>'> 회원가입</a>
				    </li>
	    		</c:when>
	    		<c:otherwise>
	    			<li class="nav-item">
				        <%=sessionId %>님 로그인 중
				    </li>
	    			<li class="nav-item">
				        <a class="nav-link" href="<c:url value="/member/logoutMember.jsp"/>">로그아웃</a>
				    </li>
	    			<li class="nav-item">
				        <a class="nav-link" href="<c:url value="/member/updateMember.jsp"/>">회원수정</a>
				    </li>
	    		</c:otherwise>
	    	</c:choose>
	    </ul>
	  </div>
	</nav>
	<hr />
	