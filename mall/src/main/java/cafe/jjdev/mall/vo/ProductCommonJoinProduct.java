package cafe.jjdev.mall.vo;

import java.util.List;

public class ProductCommonJoinProduct {
	private ProductCommon productCommon;
	private List<Product> list;
	public ProductCommon getProductCommon() {
		return productCommon;
	}
	public void setProductCommon(ProductCommon productCommon) {
		this.productCommon = productCommon;
	}
	public List<Product> getList() {
		return list;
	}
	public void setList(List<Product> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return "ProductCommonJoinProduct [productCommon=" + productCommon + ", list=" + list + "]";
	}
	
}
