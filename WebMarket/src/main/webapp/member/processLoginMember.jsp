<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>processLoginMember.jsp</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	%>
	<sql:setDataSource var="dataSource" 
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.driver.OracleDriver"
	user="C##dbexam"
	password="m1234"
	/>
	<sql:query dataSource="${dataSource }" var="rs">
		select * from w_member where id=? and password=?
		<sql:param value="<%=id %>"/>
		<sql:param value="<%=pw %>"/>
	</sql:query>
	
	<c:forEach items="${rs.rows }" var="row">
		<%
			session.setAttribute("sessionId", id);
		%>
		<c:redirect url="resultMember.jsp?msg=2"/>
	</c:forEach>
	
	<c:redirect url="loginMember.jsp?error=1"/>
</body>
</html>













