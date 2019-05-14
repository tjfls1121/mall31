<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<h1>MEMBER REMOVE FORM(spring mvc + mybatis 방식)</h1>
     <form  class="form-inline" id="removeForm" action="${pageContext.request.contextPath}/member/removeMember" method="post">
         <input name="memberId" value="${param.memberId}" type="hidden"/>
         <div class="form-group">
             <label for="memberPw">비밀번호확인 :</label>
             <input class="form-control" id="memberPw" name="memberPw" type="password">
         </div>
         <div class="form-group">
             <input class="btn btn-default" id="removeButton" type="submit" value="제출하기"/>
         </div>
     </form>
</div>
</body>
</html>