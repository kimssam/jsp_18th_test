function checkAddProduct(){
	let productId = document.getElementById("productCode")
	let name = document.getElementById("name")
	let unitPrice = document.getElementById("unitPrice")
	let unitsInStock = document.getElementById("unitsInStock")
	let productImage = document.getElementById("productImage")
	
	/*
	유효성 검증 조건
	[1]productId : 첫글자를 반드시 P로 시작하고 숫자를 조합해서 5-10자까지 입력
	[2]name: 최소 1-10자로 입력
	[3]unitPrice: 숫자만 입력, 음수 안됨
	[4]unitsInStock: 숫자만 입력
	[5]image: 이미지 등록 안하면 제출안됨
	*/
	
	function check(regExp, e, msg){
		if(regExp.test(e.value)){
			return true; //submit을 하겠다는 의미
		}else{
			alert(msg)
			e.select()
			e.focus()
			return false
		}
	}
	
	if(!check(/^P[0-9]{4,9}$/,productId,"[상품코드]\n첫글자를 반드시 P로 시작하고 숫자를 조합해서 5-10자까지 입력하세요")) return false
	
	if(name.value.length < 1 || name.value.length > 10){
		alert("[상품명]\n최소 1자에서 10자 이내로 입력하세요")
		name.select()
		name.focus()
		return false
	}
	
	if(unitPrice.value.length==0 || isNaN(unitPrice.value)){
		alert("[상품가격]\n숫자를 입력해주세요")
		unitPrice.select()
		unitPrice.focus()
		return false
	}
	if(unitPrice.value <0 ){
			alert("[상품가격]\n음수를 넣을 수 없습니다.")
			unitPrice.select()
			unitPrice.focus()
			return false
	}
	
	if(unitsInStock.value.length==0 || isNaN(unitsInStock.value)){
			alert("[재고 수]\n숫자를 입력해주세요")
			unitPrice.select()
			unitPrice.focus()
			return false
	}
	if(!productImage.value){
		alert("제품의 이미지를 첨부해 주세요")
		return false
	}
	document.newProduct.submit()
}

function checkUpdateProduct(){
	let productId = document.getElementById("productCode")
	let name = document.getElementById("name")
	let unitPrice = document.getElementById("unitPrice")
	let unitsInStock = document.getElementById("unitsInStock")
	let productImage = document.getElementById("productImage")
	
	/*
	유효성 검증 조건
	[1]productId : 첫글자를 반드시 P로 시작하고 숫자를 조합해서 5-10자까지 입력
	[2]name: 최소 1-10자로 입력
	[3]unitPrice: 숫자만 입력, 음수 안됨
	[4]unitsInStock: 숫자만 입력
	[5]image: 이미지 등록 안하면 제출안됨
	*/
	
	function check(regExp, e, msg){
		if(regExp.test(e.value)){
			return true; //submit을 하겠다는 의미
		}else{
			alert(msg)
			e.select()
			e.focus()
			return false
		}
	}
	
	if(!check(/^P[0-9]{4,9}$/,productId,"[상품코드]\n첫글자를 반드시 P로 시작하고 숫자를 조합해서 5-10자까지 입력하세요")) return false
	
	if(name.value.length < 1 || name.value.length > 10){
		alert("[상품명]\n최소 1자에서 10자 이내로 입력하세요")
		name.select()
		name.focus()
		return false
	}
	
	if(unitPrice.value.length==0 || isNaN(unitPrice.value)){
		alert("[상품가격]\n숫자를 입력해주세요")
		unitPrice.select()
		unitPrice.focus()
		return false
	}
	if(unitPrice.value <0 ){
			alert("[상품가격]\n음수를 넣을 수 없습니다.")
			unitPrice.select()
			unitPrice.focus()
			return false
	}
	
	if(unitsInStock.value.length==0 || isNaN(unitsInStock.value)){
			alert("[재고 수]\n숫자를 입력해주세요")
			unitPrice.select()
			unitPrice.focus()
			return false
	}
	
	document.UpdateProduct.submit()
}






















