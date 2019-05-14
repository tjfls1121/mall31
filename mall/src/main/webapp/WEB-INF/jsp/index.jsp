<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>index</h1>
	<h3>쇼핑몰 메인 페이지_</h3>
	<div>
		<ol>
			<c:if test="${loginMember == null }">
				<li><a href="${pageContext.request.contextPath}/member/login">로그인</a></li>
				<li><a href="${pageContext.request.contextPath}/member/checkId">회원가입</a></li>
			</c:if>
			<c:if test="${loginMember != null }">
				<li><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
				<li><a href="${pageContext.request.contextPath}/member/getMember">마이페이지</a></li>
				${loginMember.memberName} ${loginMember.memberLevel}님 안녕하세요!
			</c:if>
		</ol>
	</div>
	<!-- 쇼핑몰 메뉴 -->
	<div>
		<ul>
			<c:forEach var="category" items="${categoryList}">
				<li>
					<a href="${pageContext.request.contextPath}/product/getProductListByCategory?categoryNo=${category.categoryNo}">${category.categoryName}</a>
				</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>