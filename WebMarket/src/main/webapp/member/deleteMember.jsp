<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteMember.jsp</title>
</head>
<body>
	<%
		String sessionId = (String)session.getAttribute("sessionId");
	%>
	<sql:setDataSource var="dataSource" 
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.driver.OracleDriver"
	user="C##dbexam"
	password="m1234"
	/>
	<sql:update dataSource="${dataSource }" var="rs">
		delete from w_member where id=?
		<sql:param value="<%=sessionId %>"/>
	</sql:update>
	
	<c:if test="${rs >= 1 }">
		<c:import url="logoutMember.jsp"/>
		<c:redirect url="resultMember.jsp"/>
	</c:if>
</body>
</html>







