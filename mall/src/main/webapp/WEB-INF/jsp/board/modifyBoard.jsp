<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<title>BOARD MODIFY FORM(spring mvc + mybatis 방식)</title>
</head>
<body>
<div class="container">
    <h1>BOARD MODIFY FORM(spring mvc + mybatis 방식)</h1> 
    <form id="modifyForm" action="${pageContext.request.contextPath}/board/modifyBoard" method="post">
        <div class="form-group">boardNo :
            <input class="form-control" name="boardNo" value="${board.boardNo}" type="text" readonly="readonly"/>
        </div>
        <div class="form-group">
            <label for="boardPw">비밀번호 확인 :</label>
            <input class="form-control" name="boardPw" id="boardPw" type="password"/>
        </div>    
        <div class="form-group">
            <label for="boardPw">boardTitle :</label>
            <input class="form-control" value="${board.boardTitle}" name="boardTitle" id="boardTitle" type="text"/>
        </div>
        <div class="form-group">boardContent :
            <textarea class="form-control" id="boardContent" name="boardContent" rows="5" cols="50">${board.boardContent}</textarea>
        </div>
<%--         <div class="form-group">
            <label for="boardFile">boardFile :</label>
            <input class="form-control" name="boardFile" id="boardFile" value="${boardFile.boardFileNo}" type="file"/>
        </div> --%>
        <div>
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
			<a class="btn btn-default" href="${pageContext.request.contextPath}/board/removeFile?boardFileNo=${boardFile.boardFileNo}">삭제</a>
		</div>
        <div>
            <input class="btn btn-default" id="modifyButton" type="submit" value="글수정"/>
            <input class="btn btn-default" type="reset" value="초기화"/>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/board/getBoardList">글목록</a>
        </div>
    </form>
</div>
</body>
</html>

