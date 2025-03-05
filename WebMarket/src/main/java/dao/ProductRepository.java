package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {
	private ArrayList<Product> listOfProducts = new ArrayList<>();
	
	//ProductRepository를 싱글톤으로 사용하기 위한 코드 추가
	private static ProductRepository instance = new ProductRepository();
	public static ProductRepository getInstance() {
		return instance;
	}
	
	
	public ProductRepository() {
		Product phone = new Product("p1234","iphone",1000000);
		phone.setDescription("모델명/품번: MYNJ3KH/A\r\n"
				+ "화면크기: 15.9cm\r\n"
				+ "전면카메라 화소: 1200만 화소\r\n"
				+ "후면카메라 화소: 4800만 화소\r\n"
				+ "후면 카메라 구성: 트리플 카메라\r\n"
				+ "쿠팡상품번호: 8335434891 - 24068312674");
		phone.setCategory("Smart Phone");
		phone.setMenufacturer("Apple");
		phone.setUnitsInStock(50000);
		phone.setCondition("New");
		phone.setFilename("P1234.png");
		
		Product notebook = new Product("p4434","LG그램15 코어i5",799000);
		notebook.setDescription("저장장치: SSD\r\n"
				+ "내장마이크 탑재여부: 내장마이크\r\n"
				+ "그래픽카드 형태: 미장착\r\n"
				+ "가전 모델: LG 그램\r\n"
				+ "저장장치 인터페이스: M.2 NVMe\r\n"
				+ "쿠팡상품번호: 8161773808 - 23271242157");
		notebook.setCategory("Notebook");
		notebook.setMenufacturer("LG전자");
		notebook.setUnitsInStock(150000);
		notebook.setCondition("Old");
		notebook.setFilename("P1235.png");
		
		Product tablet = new Product("p2534","베이크 드로잉 펜 타블렛",59000);
		tablet.setDescription("타블렛 형태: 일반형\r\n"
				+ "유무선 여부: 유선\r\n"
				+ "사이즈: 358 × 200 × 9 mm\r\n"
				+ "중량: 550g\r\n"
				+ "펜심 포함 여부: 펜심 포함\r\n"
				+ "쿠팡상품번호: 1321199951 - 17508491950");
		tablet.setCategory("Tablet");
		tablet.setMenufacturer("와콤");
		tablet.setUnitsInStock(7000);
		tablet.setCondition("recycle");
		tablet.setFilename("P1236.png");
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
	}
	
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	
	//id로 해당하는 dto객체 얻기
	public Product getProductById(String productId) {
		Product productById = null;
		
		for(int i=0; i<listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if(product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
	}
	

	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
}



