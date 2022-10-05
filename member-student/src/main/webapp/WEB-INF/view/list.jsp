<%@page import="cs.dit.MemberDto"%>
<%@page import="cs.dit.MemberDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>  


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사용자목록</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container"><br>	
	<h2 class="text-center font-weight-bold">사용자 목록</h2>
	<br>
	<table class="table table-hover">
		<tr>
			<th>id</th>
			<th>name</th>
			<th>email</th>
			<th>joinDate</th>
		</tr>

		<c:forEach var='dto' items='${dtos}'>
			<tr>
			
				<!-- 5. updateForm.jsp로 id를 get 방식으로 전송하고 화면에 id를 출력할 것 -->
				<td><a href="updateForm.do?id=${dto.id }">${dto.id }</a></td>
				
				<td>${dto.name}</td>
				<td>${dto.email}</td>
				<td><fmt:formatDate value="${dto.joinDate}"/></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<input type="button" value ="홈으로" onclick ="location.href='index.do'">
	<input type="button" value ="멤버 등록" onclick ="location.href='insertForm.do'">
	</div>	
	
	<div class="d-flex justify-content-center">
		<ul class="pagination">
		
		  <c:if test="${startNum > 1}">
		  	<li class="page-item"><a class="page-link" href="list.do?p=${startNum-1}">Previous</a></li>
		  </c:if>
		  
			<c:if test="${startNum <= 1}">
		  	<li class="page-item"><a class="page-link" onclick="alert('이전 페이지가 없습니다!');" style="color:gray">Previous</a></li>
		  </c:if>
		  
		  <c:forEach var="i" begin="0" end="4" step="1">
		  	<c:if test="${startNum+i <= lastNum}">
			  	<c:if test="${startNum+i == p}">
			  		<li class="page-item active"><a class="page-link" href="list.do?p=${startNum+i}">${startNum+i}</a></li>
			  	</c:if>
			  	
			  	<c:if test="${startNum+i != p}">
			  		<li class="page-item"><a class="page-link" href="list.do?p=${startNum+i}">${startNum+i}</a></li>
			  	</c:if>
			  </c:if>
		  </c:forEach>
		  
		  <c:if test="${startNum+5 <= lastNum}">
		  	<li class="page-item"><a class="page-link" href="list.do?p=${startNum+5}">Next</a></li>
		  </c:if>
		  
		  <c:if test="${startNum+5 > lastNum}">
		  	<li class="page-item"><a class="page-link" onclick="alert('마지막 페이지입니다!');" style="color:gray">Next</a></li>
		  </c:if>
	  	
		</ul>
	</div>
	
</body>
</html>