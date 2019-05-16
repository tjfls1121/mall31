package cafe.jjdev.mall.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cafe.jjdev.mall.service.ProductCommonService;
import cafe.jjdev.mall.vo.Product;
import cafe.jjdev.mall.vo.ProductCommon;

@Controller
public class ProductCommonController {
	@Autowired private ProductCommonService productCommonService;
	
	  // 상품 옵션
	  @GetMapping(value = "/product/getProductDescription") 
	  public String getProduct(Model model
			  , @RequestParam(value="productCommonNo") int productCommonNo) { 
		  ProductCommon productCommon = productCommonService.getProduct(productCommonNo);
		  System.out.println("[ProductCommonController] productCommon : "+productCommon);
		  
		  model.addAttribute("productCommon", productCommon);
		  
		  return "/product/getProductDescription";
	  }
	 
	
	// 상품목록 
	@GetMapping("/product/getProductListByCategory")
	public String getProductListByCategory(Model model
				, @RequestParam(value="categoryNo") int categoryNo
				, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
				, @RequestParam(value="searchWord" , defaultValue = "") String searchWord) {
		Map<String, Object> map = productCommonService.getProductCommonListByCategoryNo(categoryNo, currentPage, searchWord);
		System.out.println("[ProductCommonController] map : "+map);
		model.addAttribute("categoryNo", categoryNo);
		model.addAttribute("productCommonList", map.get("list"));
		model.addAttribute("lastPage",map.get("lastPage"));
		model.addAttribute("productCommonCount", map.get("productCommonCount"));
		model.addAttribute("currentPage", currentPage);
		return "/product/getProductListByCategory";
	}
}
