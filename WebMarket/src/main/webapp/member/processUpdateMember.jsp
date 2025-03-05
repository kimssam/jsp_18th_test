<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>processUpdateMember</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String year = request.getParameter("birthyy");
		String month = request.getParameter("birthmm");
		String day = request.getParameter("birthdd");
		String birth = year+"-"+month+"-"+day;
		String mail1 = request.getParameter("mail1");
		String mail2 = request.getParameter("mail2");
		String mail = mail1+"@"+mail2;
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		System.out.println("====="+id);
	%>
	
	<sql:setDataSource var="dataSource" 
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.driver.OracleDriver"
	user="C##dbexam"
	password="m1234"
	/>
	
	<sql:update var="rs" dataSource="${dataSource }">
		update w_member set name=?, birth=?, mail=?, 
phone=?, address=?, updatetime=sysdate  where id=?
		<sql:param value="<%=name %>"/>
		<sql:param value="<%=birth %>"/>
		<sql:param value="<%=mail %>"/>
		<sql:param value="<%=phone %>"/>
		<sql:param value="<%=address %>"/>
		<sql:param value="<%=id %>"/>
	</sql:update>
	
	<c:if test="${rs>=1 }">
		<c:redirect url="./resultMember.jsp?msg=0"/>
	</c:if>
</body>
</html>

