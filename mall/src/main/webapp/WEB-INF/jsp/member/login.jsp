<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
    <h1>LOGIN</h1>
    <form id="loginForm" 
    	  action="${pageContext.request.contextPath}/member/login" 
    	  method="post">
        <div class="form-group">
            <label for="memberId">아이디 : </label>
            <input class="form-control" name="memberId" id="memberId" type="text"/>
        </div>
        <div class="form-group">
            <label for="memberPw">비밀번호 : </label>
            <input class="form-control" name="memberPw" id="memberPw" type="password"/>
        </div>
        <div>
            <input class="btn btn-default" id="addButton" type="submit" value="로그인"/>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/index">홈으로</a>
        </div>
        <div>
        	<a class="btn btn-default" href="${pageContext.request.contextPath}/member/findId">아이디찾기</a>
        	<a class="btn btn-default" href="${pageContext.request.contextPath}/index">비밀번호찾기</a>
        	<a class="btn btn-default" href="${pageContext.request.contextPath}/member/addMember">회원가입</a>
        </div>
    </form>
</div>
</body>
</html>