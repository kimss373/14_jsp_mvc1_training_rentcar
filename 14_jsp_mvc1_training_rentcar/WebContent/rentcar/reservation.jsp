<%@page import="rentcar.dao.RentcarDAO"%>
<%@page import="rentcar.dto.RentcarDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservation</title>
<script>

	
	window.onload = function() {
		
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth() + 1;
		var date = today.getDate();
		
		if (month < 10) {
			month = "0" + month;
		}
		
		if (date < 10) {
			date = "0" + date;
		}
		today = year + "-" + month + "-" + date;
		
		document.getElementById("startDt").value = today;
		document.getElementById("startDt").min = today;
	}
	

	function checkData() {
		
		var startDt = document.getElementById("startDt").value;
		var period = document.getElementById("period").value;
		
		if (confirm(startDt + "일 부터 (" + period +") 일간 예약을 진행합니다.")) {
			return true;
		}
		else {
			return false;
		}
		
	}
	
</script>
</head>
<body>

	<%
	
		String memberId = (String)session.getAttribute("memberId");
		
		int carCd = Integer.parseInt(request.getParameter("carCd"));
		RentcarDTO rentcarDTO = RentcarDAO.getInstance().getRentcarDetail(carCd);
		
	%>
	
	<div align="center">
		<h2><%=rentcarDTO.getCarNm()%> 차량 선택</h2>
		<p>
			<img alt="차량이미지" src="../carImg/<%=rentcarDTO.getImgNm()%>" width="500" height="300">
		</p>
		<form action="layout.jsp?body=reservationPro.jsp" method="post" onsubmit="return checkData()">
			<table border="1">
				<tbody align="center">
					<tr>
						<td width="20%">차량이름</td>
						<td width="80%"><%=rentcarDTO.getCarNm()%></td>
					</tr>
					<tr>
						<td>차량분류</td>
						<td><%=rentcarDTO.getClassification()%></td>
					</tr>
					<tr>
						<td>1일 렌트비용</td>
						<td><%=rentcarDTO.getRentPrice()%>원</td>
					</tr>
					<tr>
						<td>제조회사</td>
						<td><%=rentcarDTO.getBrandNm()%></td>
					</tr>
					<tr>
						<td>예약일</td>
						<td>
							<input type="date" id="startDt" name="startDt" >
						</td>
					</tr>
					<tr>
						<td>렌트기간</td>
						<td>
							<select id="period" name="period">
								<%
									for (int i = 1; i <= 14; i ++) {
								%>
									<option value="<%=i %>"><%=i %>일</option>
								<% 		
									}
								%>
							</select>
						</td>
					</tr>
					<tr>
						<td>차량 정보 보기</td>
						<td><%=rentcarDTO.getInfo()%></td>
					</tr>
				</tbody>
			</table>
			<p>
				<input type="hidden" name="memberId" value="<%=memberId%>">
				<input type="hidden" name="carCd" value="<%=rentcarDTO.getCarCd()%>">
				<input type="submit" value="예약하기">
			</p>
		</form>
	</div>
</body>
</html>