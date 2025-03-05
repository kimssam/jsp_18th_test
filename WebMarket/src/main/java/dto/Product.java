package dto;

import java.io.Serializable;

public class Product implements Serializable{
	private String productId; //상품아이디
	private String pname; //상품명
	private int unitPrice; //상품가격
	private String description; //상품설명
	private String menufacturer; //제조사
	private String category; //분류
	private long unitsInStock ; //재고수
	private String condition; //신상품 or 중고품 or 재활용품
	//이미지 파일명 추가
	private String filename;
	//장바구니에 담은 갯수
	private int quantity;
	
	
	//장바구니 getter/setter 추가
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	//이미지 파일 getter/setter추가
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	
	public String getProductId() {
		return productId;
	}
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Product(String productId, String pname, int unitPrice) {
		super();
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
	}

	public String getPname() {
		return pname;
	}
	public int getUnitPrice() {
		return unitPrice;
	}
	public String getDescription() {
		return description;
	}
	public String getMenufacturer() {
		return menufacturer;
	}
	public String getCategory() {
		return category;
	}
	public long getUnitsInStock() {
		return unitsInStock;
	}
	public String getCondition() {
		return condition;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setMenufacturer(String menufacturer) {
		this.menufacturer = menufacturer;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	
	
}
