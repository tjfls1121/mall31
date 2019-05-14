<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PRODUCT VIEW(spring mvc 방식 + mybatis)</title>
</head>
<body>
<div class="container">
    <h1>PRODUCT VIEW(spring mvc + mybatis 방식)</h1>
     <table class="table">
         <tbody>
			<tr>
                <td>상품번호 :</td>
                <td>${board.boardNo}</td>
            </tr>
            <tr>
				<td>productCommonNo :</td>
                <td>${board.boardTitle}</td>
            </tr>
            <tr>
                <td>색상 :</td>
                <td>${board.boardContent}</td>
            </tr>
            <tr>
                <td>사이즈 :</td>
                <td>${board.boardUser}</td>
            </tr>
            <tr>
                <td>남은 수량 :</td>
                <td>${board.boardDate}</td>
            </tr>
            <c:if test = '${boardFile ne null}'>
				<tr>
					<td>board_file</td>
					<td>
						<a href="/upload/${boardFile.boardFileSaveName}.${boardFile.boardFileExt}">
							${boardFile.boardFileSaveName}.${boardFile.boardFileExt}
						</a>
					</td>
				</tr>
			</c:if>
        </tbody>
    </table>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/board/modifyBoard?boardNo=${board.boardNo}&boardFileNo=${boardFile.boardFileNo}">수정</a>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/board/removeBoard?boardNo=${board.boardNo}&boardFileNo=${boardFile.boardFileNo}">삭제</a>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/board/getBoardList">글목록</a>
</div>

<!-- 댓글 목록 -->
<div class="container">
	<h1>:::::댓글:::::</h1>
	<c:forEach var="bc" items="${boardCommentList}">
		<div>
			${bc.boardCommentContent}
			${bc.boardCommentUser}
		</div>
		<div>
			<a class="btn btn-default" href="${pageContext.request.contextPath}/board/removeBoardComment?boardCommentNo=${bc.boardCommentNo}&&boardNo=${bc.boardNo}">삭제</a>
		</div>
	</c:forEach>
</div>

<!-- 댓글 입력 폼 -->
<div class="container">
	<form action="${pageContext.request.contextPath}/board/addBoardComment" method="post">
		<input type="hidden" name="boardNo" value="${board.boardNo}">
		<div>
			<textarea name="boardCommentContent" cols="80" rows="3"></textarea>
		</div>
		<div>
			boardCommentUser :
			<input type="text" name="boardCommentUser">
		</div>
		<div>
			boardCommentPassword :
			<input type="text" name="boardCommentPassword">
		</div>
		<div>
			<button type="submit">댓글 입력</button>
		</div>
	</form>
</div>

</body>
</html>

