package cafe.jjdev.mall.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import cafe.jjdev.mall.vo.Board;

@Mapper
public interface BoardMapper {
	// 게시물 수정
	public int updateBoard(Board board);
	
	// 게시물 삭제
	public int deleteBoard(Board board);
	
	// 게시물 상세보기
	public Board selectBoard(int boardNo);
	
	// 게시물 목록
	public List<Board> selectBoardList(Map<String, Integer> map);
	
	// 게시물 수
	public int selectBoardCount();
	
	// 게시물 작성
	public int insertBoard(Board board);
	
	// 파일, 댓글 한번에 삭제
	public Board selectForDeleteFileAndComment(int boardNo);
}
