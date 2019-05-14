<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<title>BOARD COMMENT REMOVE FORM(spring mvc + mybatis 방식)</title>
</head>
<body>
<div class="container">
<h1>BOARD REMOVE FORM(spring mvc + mybatis 방식)</h1>
     <form  class="form-inline" id="removeForm" action="${pageContext.request.contextPath}/board/removeBoardComment" method="post">
         <!-- boardCommentPw와 함께 boardCommentNo값도 숨겨서(hidden값으로) 넘김 -->
         <input name="boardCommentNo" value="${param.boardCommentNo}" type="hidden"/>
         <input name="boardNo" value="${param.boardNo}" type="hidden"/>
         <div class="form-group">
             <label for="boardCommentPw">비밀번호확인 :</label>
             <input class="form-control" id="boardCommentPw" name="boardCommentPw" type="password">
         </div>
         <div class="form-group">
             <input class="btn btn-default" id="removeButton" type="submit" value="삭제"/>
         </div>
     </form>
</div>
</body>
</html>