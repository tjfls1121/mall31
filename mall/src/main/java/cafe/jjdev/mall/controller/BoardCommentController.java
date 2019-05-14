package cafe.jjdev.mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cafe.jjdev.mall.service.BoardCommentService;
import cafe.jjdev.mall.vo.BoardComment;

@Controller
public class BoardCommentController {
	@Autowired
	private BoardCommentService boardCommentService;
	
	@PostMapping(value="/board/addBoardComment")
	public String addBoardComment(BoardComment boardComment) {
		// 댓글 등록
		int result = boardCommentService.addBoardComment(boardComment);
		return "redirect:/board/getBoard?boardNo="+boardComment.getBoardNo();
	}
	
	@GetMapping(value="/board/removeBoardComment")
	public String deleteBoardComment(Model model, @RequestParam(value="boardCommentNo", required=true) int boardCommentNo) {
		model.addAttribute("boardCommentNo", boardCommentNo);
		return "/board/removeBoardComment";
	}
	
	@PostMapping(value="/board/removeBoardComment")
	public String deleteBoardComment(BoardComment boardComment) {
		// 댓글 하나하나 삭제
		boardCommentService.deleteBoardComment(boardComment);
		return "redirect:/board/getBoard?boardNo="+boardComment.getBoardNo();
	}
}