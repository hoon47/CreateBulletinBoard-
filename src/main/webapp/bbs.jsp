<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 반응형 웹사이트에 적용 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 디자인을 담당할 css가 참조됨 -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>

	<!-- 하나의 웹사이트에 전반적인 구성을 보여주는것 -->
	<nav class="navbar navbar-default">
		<!-- 홈페이지에 로고같은걸 담는 영역 -->
		<div class="navbar-header">
			<!-- 버튼 만들어줌, collapse 클릭하면 내용이 펼쳐지고 다른 내용은 접히는 특수효과 -->
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expended="false">
				<!-- 웹 접근성 측면에서 열린부분은 true, 닫힌부분은 false  -->
				<!-- 아이콘 바 3줄 오른쪽 위 3줄 -->
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<!-- brand <-로고 같은거 넣어줌 -->
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="bbs.jsp">게시판</a></li>
			</ul>
			<%
			//로그인 된 상태가 아니라면
			if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expended="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<!-- active <- 현재 선택이 되었다는 뜻 -->
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
			<%
			//로그인 된 상태라면
			} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expended="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<!-- active <- 현재 선택이 되었다는 뜻 -->
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
			<%
			}
			%>
		</div>
	</nav>
	<div class="container">
		<!-- table-striped <- 홀수 짝수 색 번갈아가면서 보여주는 요소 -->
		<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
			<!-- thead 는 테이블의 제목부분 가장 윗줄에 해당 -->
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">번호</th>
					<th style="background-color: #eeeeee; text-align: center;">제목</th>
					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center;">작성일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>안녕하세요</td>
					<td>홍길동</td>
					<td>22-07-24</td>
					
				</tr>
			</tbody>
		</table>
							<!-- pull-right <- 버튼이 오른쪽으로 위치하게함 -->
		<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
	</div>	
	
	
	<!-- 애니메이션을 담당하게될 자바스크립트 참조 -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<!-- 부트스트립에서 기본적으로 제공하는 자바스크립트 파일 참조 -->
	<script src="js/bootstrap.js"></script>
</body>
</html>