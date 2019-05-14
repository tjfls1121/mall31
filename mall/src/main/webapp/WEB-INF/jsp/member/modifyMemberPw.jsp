<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>UPDATE PASSWORD</h1>
	<form class="form-inline" id="removeForm"
		action="${pageContext.request.contextPath}/member/modifyMemberPw"
		method="post">
		<input name="memberId" value="${param.memberId}" type="hidden" />
		<div class="form-group">
			아이디 :<input class="form-control"id="memberId" name="memberId" value ="${member.memberId}" type="text">
		</div>
		<div class="form-group">
			<label for="memberPw">현재 비밀번호 :</label> <input class="form-control"
				id="memberPw" name="memberPw" type="password">
		</div>
		<div class="form-group">
			<label for="memberPw">새 비밀번호 :</label> <input class="form-control"
				id="memberPwNew" name="memberPwNew" type="password">
		</div>
		<div class="form-group">
			<input class="btn btn-default" id="removeButton" type="submit"
				value="제출하기" />
		</div>
	</form>
</body>
</html>