<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<!-- 하나의 웹사이트에 전반적인 구성을 보여주는것 -->
	<nav class="navbar navbar-default">
	<!-- 홈페이지에 로고같은걸 담는 영역 -->
		<div class="navbar-header">
			<!-- 버튼 만들어줌, collapse 클릭하면 내용이 펼쳐지고 다른 내용은 접히는 특수효과 -->
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expended="false"> <!-- 웹 접근성 측면에서 열린부분은 true, 닫힌부분은 false  -->
				<!-- 아이콘 바 3줄 오른쪽 위 3줄 -->
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				</button>
				<!-- brand <-로고 같은거 넣어줌 -->
				<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expended="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<!-- active <- 현재 선택이 되었다는 뜻 -->
						<li class="active"><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="col=lg-4"></div>
		<div class="col=lg-4">
			<!-- jumbotron 라운드 둥글게 -->
			<div class="jumbotron" style="padding-top:20px">
				<form method="post" action="loginAction.jsp">
					<h3 style="text-align: center;">로그인 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">			
		 			</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">			
		 			</div>
		 									<!-- 버튼 모양 꾸미기 -->
		 			<input type="submit" class="btn btn-primary form-control" value="로그인">
				</form>
			</div>
				
		</div>
		<div class="col-lg-4"></div>
	</div>
	<!-- 애니메이션을 담당하게될 자바스크립트 참조 -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<!-- 부트스트립에서 기본적으로 제공하는 자바스크립트 파일 참조 -->
	<script src="js/bootstrap.js"></script>
</body>
</html>