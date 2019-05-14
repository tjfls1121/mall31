package cafe.jjdev.mall.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cafe.jjdev.mall.service.ProductCommonService;

@Controller
public class ProductCommonController {
	@Autowired private ProductCommonService productCommonService;
	
	// 상품목록 
	@GetMapping("/product/getProductListByCategory")
	public String getProductListByCategory(Model model
				, @RequestParam(value="categoryNo") int categoryNo
				, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
				, @RequestParam(value="searchWord" , defaultValue = "") String searchWord) {
		Map<String, Object> map = productCommonService.getProductCommonListByCategoryNo(categoryNo, currentPage, searchWord);
		model.addAttribute("categoryNo", categoryNo);
		model.addAttribute("productCommonList", map.get("list"));
		model.addAttribute("lastPage",map.get("lastPage"));
		model.addAttribute("productCommonCount", map.get("productCommonCount"));
		model.addAttribute("currentPage", currentPage);
		return "/product/getProductListByCategory";
	}
}
