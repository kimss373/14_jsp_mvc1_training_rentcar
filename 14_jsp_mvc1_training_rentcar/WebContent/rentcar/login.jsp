<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	
	<br>
	<fieldset>
		<h3>로그인</h3>
		<form action="loginPro.jsp" method="post">
			<p>아이디 : <input type="text" name="memberId" placeholder="아이디를 입력하세요."></p>
			<p>패스워드 : <input type="password" name="passwd" placeholder="패스워드를 입력하세요."></p>
			<p>
				<input type="submit" value="로그인">
				<input type="button" value="회원가입" onclick="location.href='layout.jsp?body=register.jsp'">
			</p>
		</form>
	</fieldset>

</body>
</html>