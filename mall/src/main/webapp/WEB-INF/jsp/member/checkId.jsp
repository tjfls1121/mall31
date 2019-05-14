<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>아이디 중복확인</h1>
<form class="form-horizontal" role="form" method="post" action="${pageContext.request.contextPath}/member/checkId">
		<div class="form-group" id="divId">
			<label for="inputId" class="col-lg-2 control-label">아이디</label>
			<div class="col-lg-10">
				<input type="text" class="form-control" name="memberId" maxlength="30">
			</div>
		</div>
		<div class="form-group">
			<div class="col-lg-offset-2 col-lg-10">
				<button type="submit" id="btn" class="btn btn-default">중복확인</button>
			</div>
		</div>
	</form>
</body>
</html>