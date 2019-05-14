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

<title>MEMBER MODIFY FORM(spring mvc + mybatis 방식)</title>
</head>
<body>
<div class="container">
	<a class="btn btn-default" href="${pageContext.request.contextPath}/index">홈으로</a>
    <h1>MEMBER MODIFY FORM(spring mvc + mybatis 방식)</h1> 
    <form id="modifyForm" action="${pageContext.request.contextPath}/member/modifyMember" method="post">
        <div class="form-group">아이디 :
            <input class="form-control" name="memberId" value="${member.memberId}" type="text" readonly="readonly"/>
        </div>
        <div class="form-group">이름 :
            <input class="form-control" name="memberName" value="${member.memberName}" type="text"/>
        </div>
        <div class="form-group">
            <label for="memberPw">비밀번호 확인 :</label>
            <input class="form-control" name="memberPw" id="memberPw" type="password"/>
        </div>    
        <div class="form-group">
            <label for="memberPhone">전화 :</label>
            <input class="form-control" value="${member.memberPhone}" name="memberPhone" id="memberPhone" type="text"/>
        </div>
        <div class="form-group">
            <label for="memberAddress">주소 :</label>
            <input class="form-control" value="${member.memberAddress}" name="memberAddress" id="memberAddress" type="text"/>
        </div>
        <div class="form-group">이메일 :
            <input class="form-control" name="memberEmail" value="${member.memberEmail}" type="text"/>
        </div>
        <div class="form-group">
			<label for="memberGender">성별 :</label> 
			<select class="form-control" name="memberGender">
					<option value="M">남</option>
					<option value="F">여</option>
			</select>
		</div>
		<div class="form-group">
            <label for="memberLevel">권한 :</label>
            <input class="form-control" value="${member.memberLevel}" name="memberLevel" id="memberLevel" type="text"/ readonly>
        </div>
        <div>
            <input class="btn btn-default" id="modifyButton" type="submit" value="수정하기"/>
        </div>
    </form>
</div>
</body>
</html>

