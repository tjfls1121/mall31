<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a class="btn btn-default" href="${pageContext.request.contextPath}/index">홈으로</a>
	<h1>비밀번호찾기 페이지</h1>
	<div class="container">
		아이디와 가입시 등록한 이메일을 입력하세요.
	</div>
	<form id="findForm" 
    	  action="${pageContext.request.contextPath}/member/findPw" 
    	  method="post">
        <div class="form-group">
            <label for="memberId">아이디 : </label>
            <input class="form-control" name="memberId" id="memberId" type="text"/>
        </div>
        <div class="form-group">
            <label for="memberEmail">이메일 : </label>
            <input class="form-control" name="memberEmail" id="memberEmail" type="text"/>
        </div> 
        <div>
        	<input class="btn btn-default" id="addButton" type="submit" value="찾기"/>
        	<a class="btn btn-default" href="${pageContext.request.contextPath}/member/login">로그인</a>
        	<a class="btn btn-default" href="${pageContext.request.contextPath}/index">비밀번호찾기</a>
        	<a class="btn btn-default" href="${pageContext.request.contextPath}/member/addMember">회원가입</a>
        </div>
    </form>
</body>
</html>