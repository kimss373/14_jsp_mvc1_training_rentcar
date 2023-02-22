<%@page import="rentcar.dto.MemberDTO"%>
<%@page import="rentcar.dao.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPro</title>
</head>
<body>

	<%
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMemberId(request.getParameter("memberId"));
		memberDTO.setPasswd(request.getParameter("passwd"));
		
		boolean isLogin = RentcarDAO.getInstance().login(memberDTO);
			
		if (isLogin) {
		
			session.setAttribute("memberId", request.getParameter("memberId"));
	%>
			<script>
				alert("로그인 되었습니다.");
				location.href = "layout.jsp";
			</script>	
	<%
			} 
			else {
	%>
			<script>
				alert("아이디와 비밀번호를 확인하세요.");
				history.go(-1);
			</script>
			
	<%
		}
	%>

</body>
</html>