<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>updateMember.jsp</title>
  </head>
  <body>
	 <%
	  	String sessionId2 = (String)session.getAttribute("sessionId");
	 %>
    <sql:setDataSource var="dataSource" 
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.driver.OracleDriver"
	user="C##dbexam"
	password="m1234"
	/>
	<sql:query var="rs" dataSource="${dataSource }">
		select * from w_member where id=?
		<sql:param value="<%=sessionId2 %>"/>
	</sql:query>
  	<script>
  		function checkForm(){
  			if(!document.updateMember.id.value){
  				alert("아이디를 입력해주세요")
  				return false
  			}
  			if(!document.updateMember.pw.value){
  				alert("비번을 입력해주세요")
  				return false
  			}
  			if(!document.updateMember.pw_confirm.value){
  				alert("비번확인을 입력해주세요")
  				return false
  			}
  			if(document.updateMember.pw.value != document.updateMember.pw_confirm.value){
  				alert("비밀번호를 동일하게 입력해주세요.")
  				return false;
  			}
  			if(!document.updateMember.name.value){
  				alert("이름을 입력해주세요")
  				return false
  			}
  			
  			document.updateMember.submit()
  		}
  	</script>
   <%@ include file="../menu.jsp" %>
   	  <div class="jumbotron">
		 <div class="container">
			 <h1 class="display-3">
			 	회원 수정
			 </h1>
		 </div>
     </div>
     
     <c:forEach var="row" items="${rs.rows }">
     	<c:set value="${row.mail }" var="mail"/>
     	<c:set value="${mail.split('@')[0] }" var="mail1"/>
     	<c:set value="${mail.split('@')[1] }" var="mail2"/>
     	
     	<c:set value="${row.birth }" var="birth"/>
     	<c:set value="${birth.split('-')[0]}" var="year"/>
     	<c:set value="${birth.split('-')[1]}" var="month"/>
     	<c:set value="${birth.split('-')[2]}" var="day"/>
     
     <!-- 본문내용 -->
     <div class="container">
     	 <div class="row">
     	 	<div class="col">
     	 		<form action='<c:url value="/member/processUpdateMember.jsp" />' method="post" name="updateMember">
				  <div class="form-group">
				    <label for="id">아이디</label>
				    <input type="text" class="form-control" id="id" name="id" placeholder="아이디" required value='<c:out value="${row.id }"/>' readonly>
				  </div>
				  
				  <div class="form-group">
				    <label for="pw">비밀번호</label>
				    <input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호" required>
				  </div>
				  
				  <div class="form-group">
				    <label for="pw_confirm">비밀번호 확인</label>
				    <input type="password" class="form-control" id="pw_confirm" name="pw_confirm" placeholder="비밀번호 확인" required>
				  </div>
				  
				  <div class="form-group">
				    <label for="name">이름</label>
				    <input type="text" class="form-control" id="name" name="name" placeholder="이름" required value='<c:out value="${row.name }"/>'>
				  </div>
				  
				  <div class="form-group">
				  	  <label for="gender">성별</label>
					  <div class="custom-control custom-radio">
					  	  <c:set var="gender" value="${row.gender }"/>
						  <input type="radio" id="gender_male" name="gender" class="custom-control-input" value="남"  disabled 
						  	<c:if test="${gender eq '남' }">
						  		<c:out value="checked"/>
						  	</c:if>
						  > 
						  <label class="custom-control-label" for="gender_male">남성</label>
						</div>
						
						<div class="custom-control custom-radio">
						  <input type="radio" id="gender_female" name="gender" class="custom-control-input" value="여"  disabled 
						  	<c:if test="${gender eq '여' }">
						  		<c:out value="checked"/>
						  	</c:if>
						  >
						  <label class="custom-control-label" for="gender_female">여성</label>
						</div>
				  </div>
				  
				  <div class="form-group">
				    <label>생년월일</label>
				    <div id="info_birth">
				    	<select class="form-control"  id="birth-year" name="birthyy">
				    		<option disabled selected>${year }</option>
				    	</select>
				    	<select class="form-control"  id="birth-month" name="birthmm">
				    		<option disabled selected>${month }</option>
				    	</select>
				    	<select class="form-control"  id="birth-day" name="birthdd">
				    		<option disabled selected>${day }</option>
				    	</select>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label>이메일</label>
				    <input type="text" class="w-50 d-inline form-control" id="mail1" name="mail1" placeholder="이메일" required value="${mail1}"> 
				    @
				    <select name="mail2" id="mail2" class="form-control d-inline w-25">
				        <option selected>${mail2 }</option>
				        <c:if test="${mail2 ne 'naver.com' }">
				    		<option>naver.com</option>
				    	</c:if>
				    	<c:if test="${mail2 ne 'gmail.com' }">
				    		<option>gmail.com</option>
				    	</c:if>
				    	<c:if test="${mail2 ne 'daum.com' }">
				    		<option>daum.com</option>
				    	</c:if>
				    </select>
				  </div>
				  
				  <div class="form-group">
				    <label for="phone">연락처</label>
				    <input type="text" class="form-control" id="phone" name="phone" placeholder="연락처" required value="${row.phone}">
				  </div>
				  
				  <div class="form-group">
				    <label for="address">주소</label>
				    <input type="text" class="form-control" id="address" name="address" placeholder="주소" required value="${row.address}">
				  </div>
				  
				  <div class="form-group">
				  	<input type="button" class="btn btn-info" value='회원수정하기' onclick="checkForm()">
				  	<input type="reset" class="btn btn-danger" value='취소'>
				  	<a href="deleteMember.jsp" class="btn btn-warning" >회원탈퇴하기</a>
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
    <script>
    	//출생년도 셀렉트 박스 option 목록 동적 생성
    	const birthYearEl = document.querySelector('#birth-year')
    	//옵션 목록 생성 여부 확인
    	isYearOptionExisted = false
    	birthYearEl.addEventListener('focus',function(){
    		if(!isYearOptionExisted){
    			isYearOptionExisted = true
    			for(let i = 1900; i<2026; i++){
    				const YearOption = document.createElement('option')
    				YearOption.setAttribute('value', i)
    				YearOption.innerText = i
    				this.appendChild(YearOption)
    			}
    		}
    	})
    	
    	//출생월 셀렉트 박스 option 목록 동적 생성
    	const birthMonthEl = document.querySelector('#birth-month')
    	//옵션 목록 생성 여부 확인
    	isMonthOptionExisted = false
    	birthMonthEl.addEventListener('focus',function(){
    		if(!isMonthOptionExisted){
    			isMonthOptionExisted = true
    			for(let i = 1; i<13; i++){
    				const MonthOption = document.createElement('option')
    				if(i<10){
    					MonthOption.setAttribute('value', "0"+i)
        				MonthOption.innerText = "0"+i
    				}else{
    					MonthOption.setAttribute('value', i)
        				MonthOption.innerText = i
    				}
    				this.appendChild(MonthOption)
    			}
    		}
    	})
    	
    	//출생일 셀렉트 박스 option 목록 동적 생성
    	const birthDayEl = document.querySelector('#birth-day')
    	//옵션 목록 생성 여부 확인
    	isDayOptionExisted = false
    	birthDayEl.addEventListener('focus',function(){
    		if(!isDayOptionExisted){
    			isDayOptionExisted = true
    			for(let i = 1; i<32; i++){
    				const DayOption = document.createElement('option')
    				if(i<10){
    					DayOption.setAttribute('value', "0"+i)
        				DayOption.innerText = "0"+i
    				}else{
    					DayOption.setAttribute('value', i)
        				DayOption.innerText = i
    				}
    				this.appendChild(DayOption)
    			}
    		}
    	})
    	</script>
    </c:forEach>
  </body>
</html>









