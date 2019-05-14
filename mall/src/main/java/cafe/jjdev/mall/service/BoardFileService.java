package cafe.jjdev.mall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import cafe.jjdev.mall.mapper.BoardFileMapper;

@Service
public class BoardFileService {
	@Autowired private BoardFileMapper boardFileMapper;
	
	public int deleteBoardFileOne(int boardFileNo) {
		// 수정화면에서 파일 삭제
		boardFileMapper.deleteBoardFileOne(boardFileNo);
		return 0;
	}
}
