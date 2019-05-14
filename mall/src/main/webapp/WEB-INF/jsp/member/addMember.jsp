<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MEMBER ADD</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
	<a class="btn btn-default" href="${pageContext.request.contextPath}/index">홈으로</a>
	<h1>회원가입 페이지</h1>
	<div class="row">
		<div class="col-sm-10">
	        <form class="form-horizontal" role="form" method="post" action="${pageContext.request.contextPath}/member/addMember">
	            <div class="form-group" id="divId">
	                <label for="inputId" class="col-lg-2 control-label">아이디</label>
	                <div class="col-lg-10">
	                    <input type="text" class="form-control" value="${memberId}" name="memberId" maxlength="30">
	                </div>
	            </div>
	            <div class="form-group" id="divPassword">
	                <label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
	                <div class="col-lg-10">
	                    <input type="password" class="form-control" name="memberPw" maxlength="30">
	                </div>
	            </div>
	            <div class="form-group" id="divName">
	                <label for="inputName" class="col-lg-2 control-label">이름</label>
	                <div class="col-lg-10">
	                    <input type="text" class="form-control" name="memberName" maxlength="15">
	                </div>
	            </div>
	            <div class="form-group" id="divPhone">
	                <label for="inputPhone" class="col-lg-2 control-label">전화</label>
	                <div class="col-lg-10">
	                    <input type="tel" class="form-control" name="memberPhone" maxlength="11">
	                </div>
	            </div>
	            <div class="form-group" id="divAddress">
	                <label for="inputAddress" class="col-lg-2 control-label">주소</label>
	                <div class="col-lg-10">
	                    <input type="text" class="form-control" name="memberAddress" data-rule-required="true" maxlength="50">
	                </div>
	            </div>
	            <div class="form-group" id="divGender">
	                <label for="inputGender" class="col-lg-2 control-label">성별</label>
	                <div class="col-lg-10">
	                    <select class="form-control" name="memberGender">
	                        <option value="M">남</option>
	                        <option value="F">여</option>
	                    </select>
	                </div>
	            </div>
	            <div class="form-group" id="divEmail">
	                <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
	                <div class="col-lg-10">
	                    <input type="text" class="form-control" name="memberEmail" data-rule-required="true" maxlength="50">
	                </div>
	            </div>
	            <div class="form-group" id="divLevel">
	                <label for="inputLevel" class="col-lg-2 control-label">권한</label>
	                <div class="col-lg-10">
	                    <input type="tel" class="form-control" name="memberLevel" value="consumer" readonly>
	                </div>
	            </div>
	            <div class="form-group">
	                <div class="col-lg-offset-2 col-lg-10">
	                    <button type="submit" id="btn" class="btn btn-default">가입하기</button>
	                </div>
	            </div>
	        </form>
		</div>
	</div>
</body>
</html>