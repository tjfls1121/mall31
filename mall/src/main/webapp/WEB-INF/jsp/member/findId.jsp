<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a class="btn btn-default" href="${pageContext.request.contextPath}/index">홈으로</a>
	<h1>아이디찾기 페이지</h1>
	<div class="container">
		이름과 가입시 등록한 이메일을 입력하세요.
	</div>
	<form id="findForm" 
    	  action="${pageContext.request.contextPath}/member/findId" 
    	  method="post">
        <div class="form-group">
            <label for="memberName">이름 : </label>
            <input class="form-control" name="memberName" id="memberName" type="text"/>
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