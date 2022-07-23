<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- UserDAO를 import 해준다 -->
<%@ page import="user.UserDAO"%>
<!-- javascript 문장을 작성하기 위해 import 해준다 -->
<%@ page import="java.io.PrintWriter"%>
<!-- 건너오는 data를 전부 utf-8로 받기위해 -->
<% request.setCharacterEncoding("UTF-8"); %>
<!-- User 자바빈즈를 사용하기 위함 scope="page" 는 현재 페이지 내에서만 사용하겠다는 것 -->
<jsp:useBean id="user" class="user.User" scope="page" />
<!-- login 페이지에서 입력받은 userID와 userPassword를 받음 -->
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
	//세션 부여
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");		
	}
	if(userID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어있습니다.')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	}
	//userDAO 인스턴스를 만들어줌 
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(user.getUserID(), user.getUserPassword());
	if (result == 1) { //로그인 성공했을 시
		//java에 Scanner scan 개념
		//" " 안에는 ' '를 사용
		session.setAttribute("userID", user.getUserID()); //로그인 성공한 아이디 세션값 부여
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}
	if (result == 0) { //비밀번호 틀렸을때
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.') ");
		script.println("history.back()"); //이전 페이지로 돌려보낸다 -> login.jsp로
		script.println("</script>");
	}
	if (result == -1) { //아이디가 존재하지 않을때
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디가 존재하지 않습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	if (result == -2) { //데이터베이스 오류
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류.!!!')");
		script.println("history.back()");
		script.println("</script>");
	}
	%>

</body>
</html>