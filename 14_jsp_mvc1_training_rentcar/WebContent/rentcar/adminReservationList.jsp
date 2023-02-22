<%@page import="rentcar.dao.RentcarDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="rentcar.dto.ReservationDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminReservationList</title>
</head>
<body>

	<div align="center">
		<h1>전체 회원 예약 현황 조회</h1>
		<table border="1">
			<tr height="40px">
				<th>차량</th>
				<th>차량명</th>
				<th>브랜드명</th>
				<th>차량분류</th>
				<th>예약자 아이디</th>
				<th>예약자 이메일</th>
				<th>예약자 연락처</th>
				<th>1일 렌트비용</th>
				<th>예약일</th>
				<th>렌트시작일</th>
				<th>렌트기간</th>
			</tr>
	<%
		ArrayList<HashMap<String,Object>> reservationList = RentcarDAO.getInstance().getReservationList();
		for (HashMap<String,Object> reservation : reservationList) {
	%>
				<tr height="70px" align="center">
					<td><img src="../carImg/<%=reservation.get("imgNm") %>" width="120px" height="70px"></td>
					<td><%=reservation.get("carNm")%></td>
					<td><%=reservation.get("brandNm")%></td>
					<td><%=reservation.get("classification")%></td>
					<td><%=reservation.get("memberId")%></td>
					<td><%=reservation.get("email")%></td>
					<td><%=reservation.get("contact")%></td>
					<td><%=reservation.get("rentPrice")%>원</td>
					<td><%=reservation.get("reserveDt")%></td>
					<td><%=reservation.get("startDt")%></td>
					<td><%=reservation.get("period")%>일</td>
				</tr>
	<%
			}
	%>
		</table>
	</div>

</body>
</html>