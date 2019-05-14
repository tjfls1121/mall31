<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MEMBER VIEW</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
</head>
<body>
<div class="container">
    <a class="btn btn-default" href="${pageContext.request.contextPath}/index">홈으로</a>
    <h1>MEMBER VIEW</h1>
     <table class="table">
         <tbody>
			<tr>
                <td>아이디 :</td>
                <td>${member.memberId}</td>
            </tr>
            <tr>
				<td>이름 :</td>
                <td>${member.memberName}</td>
            </tr>
            <tr>
                <td>전화 :</td>
                <td>${member.memberPhone}</td>
            </tr>
            <tr>
                <td>주소 :</td>
                <td>${member.memberAddress}</td>
            </tr>
            <tr>
                <td>성별 :</td>
                <td>${member.memberGender}</td>
            </tr>
            <tr>
                <td>이메일 :</td>
                <td>${member.memberEmail}</td>
            </tr>
            <tr>
                <td>권한 :</td>
                <td>${member.memberLevel}</td>
            </tr>
        </tbody>
    </table>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/member/modifyMember">수정</a>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/member/modifyMemberPw">비밀번호 수정</a>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/member/removeMember">회원탈퇴</a>
</div>

</body>
</html>

