<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<body>

	<%
	
		String memberId = (String)session.getAttribute("memberId");
		if (memberId == null) 	memberId = "GUEST";
		
	%>
	
	<table>
		<tr height="70px">
			<td colspan="2">
				<a href="01_carMain.jsp" >
					<img alt="rent_logo" src="../carImg/rent_logo.jpg" height="120px">
				</a>
			</td>
			
			<td align="right" width="200px" colspan="3">
				<%=memberId%>님
				<%
					if (memberId.equals("GUEST")) {
				%>
						<button onclick="location.href='layout.jsp?body=login.jsp'">로그인</button>
				<%
					} 
					else if(memberId.equals("admin")) {
				%>
						<button onclick="location.href='layout.jsp?body=adminReservationList.jsp'">관리자메뉴</button>
						<button onclick="location.href='logout.jsp'">로그아웃</button>
				<%
					} 
					else {
				%>
						<button onclick="location.href='logout.jsp'">로그아웃</button>
				<%
					}
				%>
			</td>
		</tr>
		
		<tr height="50px" align="center">
			<td width="200px" bgcolor="pink">
				<font color="white" size="5">
					<% 
						if (memberId.equals("admin")) {
					%>
							예 약 하 기
					<% 	
						}
						else {
					%>
							<a href="layout.jsp?body=rentcarList.jsp" style="text-decoration: none">예 약 하 기</a>
					<% 
						}
					%>				
				</font>
			</td>
			
			<td width="200" bgcolor="pink">
				<font color="white" size="5">
					<% 
						if (memberId.equals("admin")) {
					%>
							예 약 확 인
					<% 	
						}
						else {
					%>
							<a href="layout.jsp?body=myReservationList.jsp?memberId=<%=memberId %>" style="text-decoration: none">예 약 확 인</a>
					<% 
						}
					%>		
				</font>
			</td>
			<td width="200px" bgcolor="pink">
				<font color="white" size="5">자유게시판</font>
			</td>
			<td width="200px" bgcolor="pink">
				<font color="white" size="5">공 지 사 항</font>
			</td>
			<td width="200px" bgcolor="pink">
				<font color="white" size="5">고 객 센 터</font>
			</td>
		</tr>
	</table>

</body>
</html>