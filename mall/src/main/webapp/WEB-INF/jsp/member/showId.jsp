<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<c:if test="${memberId == null}">
			<tr>
				<td>
					입력한 정보와 일치하는 정보가 없습니다.
				</td>
			</tr>
		</c:if>
		<c:if test="${memberId != null}">
			<tr>
				<td>
					고객님의 정보와 일치하는 아이디 입니다.
				</td>
				<td>
					${memberId}
				</td>
			</tr>
		</c:if>
	</div>
	<div>
		<a class="btn btn-default" href="${pageContext.request.contextPath}/member/login">로그인</a> 
		<a class="btn btn-default" href="${pageContext.request.contextPath}/index">비밀번호찾기</a> 
		<a class="btn btn-default" href="${pageContext.request.contextPath}/member/addMember">회원가입</a>
	</div>
</body>
</html>