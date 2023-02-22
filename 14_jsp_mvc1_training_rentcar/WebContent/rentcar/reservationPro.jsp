<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="rentcar.dao.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservation</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");

	%>
	<jsp:useBean id="reservationDTO" class="rentcar.dto.ReservationDTO">
		<jsp:setProperty property="*" name="reservationDTO"/>
	</jsp:useBean>

	<% 
		RentcarDAO.getInstance().insertReservation(reservationDTO);
		String memberId = (String)session.getAttribute("memberId");
	%>
	
	<script>
		alert("예약 되었습니다.");
		location.href = "layout.jsp?body=myReservationList.jsp?memberId=<%=memberId%>";
	</script>
	
</body>
</html>