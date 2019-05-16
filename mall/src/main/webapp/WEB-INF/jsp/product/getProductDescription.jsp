<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PRODUCT VIEW(spring mvc 방식 + mybatis)</title>
</head>
<body>
<div class="container">
	<a class="btn btn-default" href="${pageContext.request.contextPath}/index">홈으로</a>
    <h1>PRODUCT VIEW(spring mvc + mybatis 방식)</h1>
     <table class="table">
         <tbody>
			<tr>
                <td>productCommonNo :</td>
                <td>${productCommon.productCommonNo}</td>
            </tr>
            <tr>
				<td>categoryNo :</td>
                <td>${productCommon.categoryNo}</td>
            </tr>
            <tr>
				<td>상품명 : </td>
                <td>${productCommon.productCommonName}</td>
            </tr>
            <tr>
				<td>가격 : </td>
                <td>${productCommon.productCommonPrice}</td>
            </tr>
            <tr>
				<td>상세 : </td>
                <td>${productCommon.productCommonDescription}</td>
            </tr>
        </tbody>
    </table>
    <form action="">
    	<select>
    		<c:forEach var="p" items="${productCommon.products}">
    			<option value="${p.productNo}">${p.productColor} / ${p.productSize} / 남은 수량 : ${p.productStock}</option>
	       	</c:forEach>
    	</select>
    </form>
</div>
</body>
</html>

