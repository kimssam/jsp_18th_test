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

    <title>template.jsp</title>
  </head>
  <body>
  	<script>
  		function checkForm(){
  			if(!document.newMember.id.value){
  				alert("아이디를 입력해주세요")
  				return false
  			}
  			if(!document.newMember.pw.value){
  				alert("비번을 입력해주세요")
  				return false
  			}
  			if(!document.newMember.pw_confirm.value){
  				alert("비번확인을 입력해주세요")
  				return false
  			}
  			if(document.newMember.pw.value != document.newMember.pw_confirm.value){
  				alert("비밀번호를 동일하게 입력해주세요.")
  				return false;
  			}
  			if(!document.newMember.name.value){
  				alert("이름을 입력해주세요")
  				return false
  			}
  			
  			document.newMember.submit()
  		}
  	</script>
   <%@ include file="/menu.jsp" %>
   	  <div class="jumbotron">
		 <div class="container">
			 <h1 class="display-3">
			 	회원 가입
			 </h1>
		 </div>
     </div>
     
     <!-- 본문내용 -->
     <div class="container">
     	 <div class="row">
     	 	<div class="col">
     	 		<form action='<c:url value="/member/processAddMember.jsp" />' method="post" name="newMember">
				  <div class="form-group">
				    <label for="id">아이디</label>
				    <input type="text" class="form-control" id="id" name="id" placeholder="아이디" required>
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
				    <input type="text" class="form-control" id="name" name="name" placeholder="이름" required>
				  </div>
				  
				  <div class="form-group">
				  	  <label for="gender">성별</label>
					  <div class="custom-control custom-radio">
						  <input type="radio" id="gender_male" name="gender" class="custom-control-input" checked value="남">
						  <label class="custom-control-label" for="gender_male">남성</label>
						</div>
						<div class="custom-control custom-radio">
						  <input type="radio" id="gender_female" name="gender" class="custom-control-input" value="여">
						  <label class="custom-control-label" for="gender_female">여성</label>
						</div>
				  </div>
				  
				  <div class="form-group">
				    <label>생년월일</label>
				    <div id="info_birth">
				    	<select class="form-control"  id="birth-year" name="birthyy">
				    		<option disabled selected>출생년도</option>
				    	</select>
				    	<select class="form-control"  id="birth-month" name="birthmm">
				    		<option disabled selected>월</option>
				    	</select>
				    	<select class="form-control"  id="birth-day" name="birthdd">
				    		<option disabled selected>일</option>
				    	</select>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label>이메일</label>
				    <input type="text" class="w-50 d-inline form-control" id="mail1" name="mail1" placeholder="이메일" required> 
				    @
				    <select name="mail2" id="mail2" class="form-control d-inline w-25">
				    	<option>naver.com</option>
				    	<option>gmail.com</option>
				    	<option>daum.com</option>
				    </select>
				  </div>
				  
				  <div class="form-group">
				    <label for="phone">연락처</label>
				    <input type="text" class="form-control" id="phone" name="phone" placeholder="연락처" required>
				  </div>
				  
				  <div class="form-group">
				    <label for="address">주소</label>
				    <input type="text" class="form-control" id="address" name="address" placeholder="주소" required>
				  </div>
				  
				  <div class="form-group">
				  	<input type="button" class="btn btn-info" value='회원가입하기' onclick="checkForm()">
				  	<input type="reset" class="btn btn-danger" value='취소'>
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
    
  </body>
</html>









