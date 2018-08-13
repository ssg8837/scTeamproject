<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%-- <select name="searchId" >
			<option selected disabled="disabled">사번</option>
			<c:forEach var="list" items="${list}">
				<option value="${list.empid}">${list.empid}(${list.empname})</option>
			</c:forEach>
	</select> --%>
	
	<select name="searchBaby">
		<option selected disabled="disabled">아이선택</option>
		<c:forEach var="babyList" items="${babyList}">
			<option value=""></option>
		</c:forEach>
	</select>
	<table border="1">
		<c:forEach var="list" items="${list}">
			<tr>
				<td>
					<img src="./resources/image/beforeTest.png">
				</td>
				<td>
					${list.diseasename}<br>
					${list.vaccintype}<br>
					권장일: ${list.vaccintype}<br>
					국가예방접종
				</td>
				<td>
					:
				</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>