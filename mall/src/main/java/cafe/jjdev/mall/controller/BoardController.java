package cafe.jjdev.mall.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cafe.jjdev.mall.commons.PathStr;
import cafe.jjdev.mall.service.BoardService;
import cafe.jjdev.mall.vo.Board;
import cafe.jjdev.mall.vo.BoardRequest;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	// 게시물 삭제
	@GetMapping(value="/board/removeBoard")
	public String deleteBoard(Model model, @RequestParam(value="boardNo", required=true) int boardNo) {
		model.addAttribute("boardNo", boardNo);
		return "/board/removeBoard";
	}
	
	@PostMapping(value="/board/removeBoard")
	public String deleteBoard(Board board) {
		int result = boardService.removeBoard(board);
		return "redirect:/board/getBoardList";
	}
	
	// 게시물 작성
	@GetMapping(value="/board/addBoard")
	public String addBoard() {
		return "/board/addBoard";
	}
	
	@PostMapping(value="/board/addBoard")
	public String addBoard(BoardRequest boardRequest) {
		//String path = ServletUriComponentsBuilder.fromCurrentContextPath().path("upload").toUriString();
		boardService.addBoard(boardRequest, PathStr.UPLOAD_PATH);
		return "redirect:/board/getBoardList";
	}
	
	// 게시물 수정
	@GetMapping(value="/board/modifyBoard")
	public String modifyBoard(Model model, @RequestParam(value="boardNo", required=true) int boardNo) {
		Board board = boardService.getBoard(boardNo);
		model.addAttribute("board", board);
		return "/board/modifyBoard";
	}
	
	@PostMapping(value="/board/modifyBoard")
	public String modifyBoard(Board board) {
		int result = boardService.modifyBoard(board);
		return "redirect:/board/getBoard?boardNo="+board.getBoardNo();
	}
	
	// 게시물 상세보기
	@GetMapping(value="/board/getBoard")
	public String getBoard(Model model, @RequestParam(value="boardNo", required=true) int boardNo) {
		Map<String, Object> map = boardService.getBoardAndCommentList(boardNo);
		model.addAttribute("board", map.get("board"));
		model.addAttribute("boardCommentList", map.get("boardCommentList"));
		model.addAttribute("boardFile", map.get("boardFile"));
		return "/board/getBoard";
	}
	
	// 게시물 목록
	@GetMapping(value="/board/getBoardList")
	public String getBoardList(Model model, @RequestParam(value="currentPage", required = false, defaultValue = "1") int currentPage) {
		Map<String, Object> map = boardService.getBoardList(currentPage);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("boardCount", map.get("boardCount"));
		model.addAttribute("currentPage", currentPage);
		return "board/getBoardList";
	}
}
