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


	<!-- Start Header Area -->
	<header id="header">
<section class="home-banner-area relative">	
		<div class="container">
			<div class="row align-items-center justify-content-between d-flex">
				<div id="logo">
					<a href="index.html"><img src="<c:url value="/resources/img/mainlogo.png"/>" width="150px" height="70px" alt="" title="""/></a>
				</div> 
				
				<nav id="nav-menu-container">
				<!-- 
					<ul class="nav-menu">
						<li class="menu-active"><a href="index.html">Home</a></li>
						<li><a href="about.html">About</a></li>
						<li><a href="courses.html">Courses</a></li>
						<li class="menu-has-children"><a href="">Pages</a>
							<ul>
								<li><a href="elements.html">Elements</a></li>
							</ul>
						</li>
						<li class="menu-has-children"><a href="">Blog</a>
							<ul>
								<li><a href="blog-home.html">Blog Home</a></li>
								<li><a href="blog-single.html">Blog Details</a></li>
							</ul>
						</li>
						<li><a href="contact.html">Contact</a></li>
					</ul>
					-->
				 <a href="#" class="primary-btn white">로그인</a>
				 <a href="#" class="primary-btn white">회원가입</a>
				 <a href="#" class="primary-btn white">이용방법안내</a>
				 <br>
				 
				 <form action="" class="form-box d-flex justify-content-between">
				 <input type="text" placeholder="통합 검색" class="form-control" name="thing">
							<button type="submit" class="btn search-btn">Search</button>
							</form>
							
				</nav><!-- #nav-menu-container -->
				

			</div>
		</div>
		<!--  
		 <ul class="nav-menu" align="center">
						<li class="menu-active"><a href="index.html">자격증</a></li>
						<li><a href="about.html">직종</a></li>
						<li><a href="courses.html">기업</a></li>
						<li class="menu-has-children"><a href="">공지사항</a>
							<ul>
								<li><a href="elements.html">Elements</a></li>
							</ul>
						</li>
						
					</ul>
					 -->
					 </section>
	</header>
	<!-- End Header Area -->
	
	
	<!--  <div class="container">
		<div class="row">
			<div class="col-md-11"><h2>게시판</h2></div>
			<div class="col-md-1 text-right">
			-->
			<section class="courses-area section-gap">
			
		<div class="container">
			<div class="row fullscreen d-flex align-items-center justify-content-center">
				<div class="banner-content col-lg-8 col-md-12">
				<!-- perPageNum의 값을 정하는 select 박스, 페이지당 보여줄 수  -->
				<!-- 
				<select class="form-control" id="perPageSel">
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
				</select>
				 -->
				
				 
				 <br/>
				 <br/>
				 <br/>
				 <br/>
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

			<div>
				<a href='#' onClick='fn_write()' class="btn btn-primary pull right">글쓰기</a>
				<a href='<c:url value='/listPage'/>' class="btn btn-primary pull right">처음목록</a>
				<br/>
			</div>
		</form>

		<div class="text-center">
			<nav aria-label="pagination">
				<ul class="pagination">

					<!-- prev 버튼 -->
					<li class="page-item" id="page-prev"><a class="page-link"
						href="listPage${pg.makeQuery(pageMaker.startPage-1)}">
							Previous </a></li>

					<!-- 페이지 번호 (시작 페이지 번호부터 끝 페이지 번호까지) -->
					<c:forEach begin="${pg.startPage}" end="${pg.endPage}" var="idx">
						<li class="page-item" id="page${idx}"><a class="page-link"
							href="listPage${pg.makeQuery(idx)}"> <span>${idx}</span>
						</a></li>
					</c:forEach>

					<!-- next 버튼 -->
					<li class="page-item" id="page-next"><a class="page-link"
						href="listPage${pg.makeQuery(pg.endPage + 1)}"> Next </a></li>

				</ul>
			</nav>
		</div>

		<div class="form-group row justify-content-center">

			<div class="w100" style="padding-right: 10px">

				<select class="form-control form-control-sm" name="searchType"
					id="searchType">

					<option value="title" selected="selected">제목</option>

					<option value="content">본문</option>

					<option value="writer">작성자</option>

				</select>

			</div>

			<div class="w300" style="padding-right: 10px">

				<input type="text" class="form-control form-control-sm"
					name="keyword" id="keyword">

			</div>

			<div>

				<button class="btn btn-sm btn-primary" name="btnSearch"
					id="btnSearch">검색</button>

			</div>

		</div>
		</div>
		</div>
		</div>
		</section>
		




		<script>
			//글쓰기
			function fn_write() {

				var form = document.getElementById("boardForm");

				form.action = "<c:url value='/board/writeForm.do'/>";
				form.submit();

			}

			/*
			//글조회
			function fn_view(id){
			   
			   var form = document.getElementById("boardForm");
			   var url = "<c:url value='/board/boardView.do'/>";
			   url = url + "?id=" + id;
			   
			   form.action = url;    
			   form.submit(); 
			}
			 */
			$(function() {
				setPerPageNumSelect();
				setSearchType();
				//prev 버튼 활성화, 비활성화 처리
				var canPrev = '${pg.prev}';
				if (canPrev !== 'true') {
					$('#page-prev').hide();
				}

				//next 버튼 활성화, 비활성화 처리
				var canNext = '${pg.next}';
				if (canNext !== 'true') {
					$('#page-next').hide();
				}

				//현재 페이지 파란색으로 활성화
				var thisPage = '${pg.vo.page}';
				$('#page' + thisPage).addClass('active');
			})
			function setPerPageNumSelect() {
				var perPageNum = "${pg.vo.perPageNum}";
				var $perPageSel = $('#perPageSel');
				var thisPage = '${pg.vo.page}';
				$perPageSel.val(perPageNum).prop("selected", true);
				//PerPageNum가 바뀌면 링크 이동
				$perPageSel.on('change', function() {
					//pageMarker.makeQuery 사용 못하는 이유: makeQuery는 page만을 매개변수로 받기에 변경된 perPageNum을 반영못함
					window.location.href = "listPage?page=" + thisPage
							+ "&perPageNum=" + $perPageSel.val();
				})
			}
			function setSearchType() {
				var $searchType = $('#searchType');
				var $keyword = $('#keyword');

				//$searchType.val('${pg.vo.searchType}').prop("selected",true);

				//검색 버튼이 눌리면
				$('#btnSearch').on(
						'click',
						function() {
							console.log('클릭버튼 눌림');
							var searchTypeVal = $searchType.val();
							var keywordVal = $keyword.val();

							//검색어 입력 안했으면 검색창
							if (!keywordVal) {
								alert("검색어를 입력하세요!");
								$('#keyword').focus();
								return;
							}
							var url = "listPage?page=1" + "&perPageNum="
									+ "${pg.vo.perPageNum}" + "&searchType="
									+ searchTypeVal + "&keyword="
									+ encodeURIComponent(keywordVal);
							window.location.href = url;
						})
			}
		</script>
	</div>
</body>
</html>