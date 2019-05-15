package cafe.jjdev.mall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cafe.jjdev.mall.mapper.ProductCommonMapper;
import cafe.jjdev.mall.vo.ProductCommon;

@Service
@Transactional
public class ProductCommonService {
	@Autowired private ProductCommonMapper productCommonMapper;
	
	// 상품 옵션
	public ProductCommon getProduct(int productCommonNo) {
		return productCommonMapper.selectProductCommonByCategory(productCommonNo);
	}
	 
	// 상품목록 페이징
	public Map<String, Object> getProductCommonListByCategoryNo(int categoryNo, int currentPage, String searchWord) {
		final int ROW_PER_PAGE = 10;
		int startRow = (currentPage-1)*ROW_PER_PAGE;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("rowPerPage", ROW_PER_PAGE);
		map.put("categoryNo", categoryNo);
		map.put("searchWord", "%"+searchWord+"%");
		System.out.println("[ProductCommonService] map : "+map);
		
		List<ProductCommon> list = productCommonMapper.selectProductCommonList(map);
		
		int productCommonCount = productCommonMapper.selectProductCommonCount(map);
		System.out.println("[ProductCommonService]productCommonCount:"+productCommonCount);
		
		int lastPage = productCommonCount/ROW_PER_PAGE;
		if(productCommonCount%ROW_PER_PAGE != 0) {
			lastPage++;
		}

		System.out.println("[ProductCommonService]lastPage:"+lastPage);
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", list);
		returnMap.put("lastPage", lastPage);
		returnMap.put("productCommonCount", productCommonCount);
		
		return returnMap;
	}
}
