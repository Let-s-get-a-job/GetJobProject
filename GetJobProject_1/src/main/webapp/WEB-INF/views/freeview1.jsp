<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
<style>
.pagination {
	justify-content: center;
}
table {
    background-color: #ffffff;
  }
<!-- bootstrap header start -->
</style>
	<!-- Mobile Specific Meta -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Favicon-->
	<link rel="shortcut icon" href="img/fav.png">
	<!-- Author Meta -->
	<meta name="author" content="codepixer">
	<!-- Meta Description -->
	<meta name="description" content="">
	<!-- Meta Keyword -->
	<meta name="keywords" content="">
	<!-- meta character set -->
	<meta charset="UTF-8">
	<!-- Site Title -->
	<title>Educature Education</title>

	<!--
			Google Font
			============================================= -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,500,600" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500i" rel="stylesheet">

	<!--
			CSS
			============================================= -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/themify-icons/0.1.2/css/themify-icons.css">
	<link rel="stylesheet" type="text/css" href="resources/css/linearicons.css">
	<link rel="stylesheet" type="text/css" href="resources/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="resources/css/magnific-popup.css">
	<link rel="stylesheet" type="text/css" href="resources/css/nice-select.css">
	<link rel="stylesheet" type="text/css" href="resources/css/animate.min.css">
	<link rel="stylesheet" type="text/css" href="resources/css/owl.carousel.css">
	<link rel="stylesheet" type="text/css" href="resources/css/main.css">

</head>
<!-- bootstrap header end -->
<body>


			<a href="#">공지사항</a> / <a href="#">질문과 답변</a> / <a href="#">서비스 개선</a>	 
		<form id="boardForm" name="boardForm" method="post">
			<table class="table table-striped table-hover" bgcolor="white">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="result" items="${list }" varStatus="status">
						<tr>
							<td><c:out value="${result.id }" /></td>
							<td><a
								href='<c:url value='/board/boardView.do'/>${pg.makeQuery(pg.vo.page)}&id=${result.id}'><c:out
										value="${result.title }" /> </a>
							<c:if test="${result.reg_datetime>=nowday}">
									<img src="image/ico_new.gif">
								</c:if></td>
							<td><c:out value="${result.writer }" /></td>
							<td><c:out value="${result.reg_datetime }" /></td>
							<td><c:out value="${result.view_cnt}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			
		</form>


</body>
</html>