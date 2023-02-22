<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
</head>
<body>

	<form action="registerPro.jsp" method="post">
		<table border="1">
			<tr height="100px">
				<td align="center" colspan="2">
					<font size="6" color="gray">회원가입</font>
				</td>
			</tr>
			<tr height="40px">
				<td width="120px" align="center">아이디</td>
				<td width="180px"><input type="text" name="memberId" size="30" placeholder="아이디를 입력하세요."></td>
			</tr>
			<tr height="40px">
				<td align="center">비밀번호</td>
				<td><input type="password" name="passwd" size="30" placeholder="비밀번호를 입력하세요."></td>
			</tr>
			<tr height="40px">
				<td align="center">이메일</td>
				<td><input type="email" name="email" size="30" placeholder="이메일을 입력하세요."></td>
			</tr>
			<tr height="40px">
				<td align="center">연락처</td>
				<td><input type="text" name="contact" size="30" placeholder="-를 포함해서 작성하세요."></td>
			</tr>
			<tr height="40px">
				<td align="center">나이</td>
				<td><input type="text" name="age" size="30" placeholder="나이를 입력하세요."></td>
			</tr>
			<tr height="40px">
				<td align="center">참고사항</td>
				<td><textarea rows="15" cols="30" name="info" placeholder="참고사항을 입력하세요."></textarea></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input type="submit" value="회원가입">
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>