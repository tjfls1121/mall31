package cafe.jjdev.mall.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import cafe.jjdev.mall.commons.PathStr;
import cafe.jjdev.mall.mapper.BoardCommentMapper;
import cafe.jjdev.mall.mapper.BoardFileMapper;
import cafe.jjdev.mall.mapper.BoardMapper;
import cafe.jjdev.mall.vo.Board;
import cafe.jjdev.mall.vo.BoardComment;
import cafe.jjdev.mall.vo.BoardFile;
import cafe.jjdev.mall.vo.BoardRequest;

@Service
@Transactional
public class BoardService {
	@Autowired private BoardMapper boardMapper;
	@Autowired private BoardFileMapper boardFileMapper;
	@Autowired private BoardCommentMapper boardCommentMapper;
	
	// 댓글,파일 달린 게시물 삭제
	public int removeBoard(Board board) {
		Board selectBoard= boardMapper.selectForDeleteFileAndComment(board.getBoardNo());
		System.out.println("selectBoard.getBoardPw() : "+selectBoard.getBoardPw());
		System.out.println("board.getBoardPw() : "+board.getBoardPw());
		
		if(selectBoard.getBoardPw( ) == board.getBoardPw()) {
			// 파일 삭제
			BoardFile boardFile = boardFileMapper.selectBoardFileByFK(board.getBoardNo());
			if(boardFile != null) {
			File file = new File(PathStr.UPLOAD_PATH + "/"+boardFile.getBoardFileSaveName() + "." + boardFile.getBoardFileExt());
			file.delete();
			boardFileMapper.deleteBoardFile(board.getBoardNo());
			}
			
			// 댓글 삭제
			boardCommentMapper.deleteBoardCommentByCommentNo(board.getBoardNo());
			// 게시물 삭제
			boardMapper.deleteBoard(board);
		}

		return 0;
	}
	
	/*
	public int removeBoard(Board board) {
		// 게시물 삭제
		return boardMapper.deleteBoard(board);
	}
	*/
	
	// 게시물 댓글 보기
	public Map<String, Object> getBoardAndCommentList(int boardNo) {
		// 1. 게시물 상세보기
		Board board = boardMapper.selectBoard(boardNo);
		// 2. 댓글목록 보기
		List<BoardComment> boardCommentList = boardCommentMapper.selectBoardCommentListByBoardNo(boardNo);
		System.out.println("boardCommentList : "+boardCommentList);
		// 3.
		BoardFile boardFile = boardFileMapper.selectBoardFileByFK(boardNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board", board);
		map.put("boardCommentList", boardCommentList);
		map.put("boardFile", boardFile);

		return map;
	}
	
	// 게시물 목록, 페이징작업
	public Map<String, Object> getBoardList(int currentPage) {
		final int ROW_PER_PAGE = 10;
		int beginRow = (currentPage - 1)*ROW_PER_PAGE;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", ROW_PER_PAGE);
		
		List<Board> list = boardMapper.selectBoardList(map);
		int boardCount = boardMapper.selectBoardCount();
		int lastPage = boardCount/ROW_PER_PAGE;
		if(boardCount/ROW_PER_PAGE != 0 ) {
			lastPage++;
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("list", list);
		returnMap.put("lastPage", lastPage);
		returnMap.put("boardCount", boardCount);
		return returnMap;
	}
	
	// 게시물 수정
	public int modifyBoard(Board board) {
		return boardMapper.updateBoard(board);
	}
	
	// 게시물 등록
	public void addBoard(BoardRequest boardRequest, String path) {
		// 1. BoardRequest --> Board
		Board board = new Board();
		board.setBoardNo(boardRequest.getBoardNo());
		board.setBoardPw(boardRequest.getBoardPw());
		board.setBoardTitle(boardRequest.getBoardTitle());
		board.setBoardContent(boardRequest.getBoardContent());
		board.setBoardUser(boardRequest.getBoardUser());
		board.setBoardDate(boardRequest.getBoardDate());
		System.out.println("insert 전 board : "+board);
		boardMapper.insertBoard(board);
		System.out.println("insert 후 board : "+board);
		
		// 2. BoardRequest -> MultipartFile -> BoardFile
		MultipartFile multipartFile = boardRequest.getBoardFile();
		System.out.println("multipartFile : " + multipartFile);

		String originalFileName = multipartFile.getOriginalFilename();
		int i = originalFileName.lastIndexOf(".");
		System.out.println("i : "+i);
		
		if(i>=0) {
		String originName = originalFileName.substring(0, i);
		String ext = originalFileName.substring(i + 1);
		UUID uuid = UUID.randomUUID();
		String saveName = uuid.toString().replace("-", "");

		BoardFile boardFile = new BoardFile();
		boardFile.setBoardNo(board.getBoardNo());
		boardFile.setBoardFileSize(multipartFile.getSize());
		boardFile.setBoardFileType(multipartFile.getContentType());
		boardFile.setBoardFileOriginName(originName);
		boardFile.setBoardFileSaveName(saveName);
		boardFile.setBoardFileExt(ext);
		System.out.println("boardFile : " + boardFile);

		// 3. 폴더에 저장
		//String path = "c:/temp/";
		File file = new File(path + "/"+saveName + "." + ext); // 빈파일
		try {
			multipartFile.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		boardFileMapper.insertBoardFile(boardFile);
		}
	}
	
	// 게시물 수정시 가져올 때 사용
	public Board getBoard(int boardNo) {
		return boardMapper.selectBoard(boardNo);
	}
}
