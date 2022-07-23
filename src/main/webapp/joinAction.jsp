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
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
	//세션
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
	//입력을 누락한 항목이 있는지 체크
	if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
			|| user.getUserGender() == null || user.getUserEmail() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		//userDAO 인스턴스를 만들어줌 
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			session.setAttribute("userID", user.getUserID()); //로그인 성공한 아이디 세션값 부여
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}

	}
	%>

</body>
</html>