package cafe.jjdev.mall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cafe.jjdev.mall.mapper.BoardCommentMapper;
import cafe.jjdev.mall.vo.BoardComment;

@Service
@Transactional
public class BoardCommentService {
	@Autowired
	private BoardCommentMapper boardCommentMapper;
	
	public int addBoardComment(BoardComment boardComment) {
		// 댓글 등록
		return boardCommentMapper.insertBoardComment(boardComment);
	}
	
	public int deleteBoardComment(BoardComment boardComment) {
		// 댓글 개별 삭제
		return boardCommentMapper.deleteBoardCommentOne(boardComment);
	}
}