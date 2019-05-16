package cafe.jjdev.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import cafe.jjdev.mall.vo.ProductCommon;

@Mapper
public interface ProductCommonMapper {
	// product_common_count 테이블 카테고리별 행의 수를 구하는 메소드
	public int selectProductCommonCount(Map<String, Object> map);

	// 상품 목록 페이징, 이름검색
	public List<ProductCommon> selectProductCommonList(Map<String, Object> map);

	// 카테고리 목록, 상품 상세, 상품 옵션
	public ProductCommon selectProductCommonByCategory(int productCommonNo);
}
