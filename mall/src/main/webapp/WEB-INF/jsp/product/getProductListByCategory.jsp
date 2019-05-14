<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PRODUCT LIST(spring mvc + mybatis 방식)</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<script>
	$(document).ready(function() {
		$('#searchBtn'). click(function() {
			$('#searchForm').submit();
		});
	});
</script>
</head>
<body>
<a class="btn btn-default" href="${pageContext.request.contextPath}/index">홈으로</a>
<div class="container">
    <h1>PRODUCT COMMON LIST(spring mvc + mybatis 방식)</h1>
    <div>전체행의 수 : ${productCommonCount}</div>
    <table class="table table-striped">
        <thead>
            <tr>
            	<th>productCommonNo</th>
            	<th>categoryNo</th>
                <th>productCommonName</th>
                <th>productCommonPrice</th>
                <th>productCommonDescription</th>
                <th>productCommonDate</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="productCommon" items="${productCommonList}">
                <tr>
                	<td>${productCommon.productCommonNo}</td>
                    <td>${productCommon.categoryNo}</td>
                    <td><a href="${pageContext.request.contextPath}/product/getProductDescription">${productCommon.productCommonName}</a></td>
                    <td>${productCommon.productCommonPrice}</td>
                    <td>${productCommon.productCommonDescription}</td>
                    <td>${productCommon.productCommonDate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <form action="${pageContext.request.contextPath}/product/getProductListByCategory" method="get">
    	<input type="hidden" value="${categoryNo}" name="categoryNo">
    	productName 검색어 : <input type="text" name="searchWord">
    	<button id="searchBtn" type="button">검색</button>
    </form>
    <ul class="pager">
        <c:if test="${currentPage > 1}">
            <a href="/product/getProductListByCategory?currentPage=${currentPage-1}&categoryNo=${categoryNo}">이전</a>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <a href="/product/getProductListByCategory?currentPage=${currentPage+1}&categoryNo=${categoryNo}">다음</a>
        </c:if>
    </ul>
</div>
</body>
</html>