<%@page import="rentcar.dto.RentcarDTO"%>
<%@page import="rentcar.dao.RentcarDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rentcarList</title>
</head>
<body>

	<%
		String memberId = (String) session.getAttribute("memberId");
		 		
 		if (memberId == null) {
	%>
			<script>
				alert("로그인을 먼저 해주세요.");
				location.href = 'layout.jsp?body=login.jsp';
			</script>
	<%
		}
	%> 
	
	
	
	
	
	<div align="center">
		<table>
			<tr height="100px">
				<td align="center" colspan="3">
					<font size="6" color="gray">전체 렌트카 보기</font>
				</td>
			</tr>
			
			
		<%
				ArrayList<RentcarDTO> rentcarList = RentcarDAO.getInstance().getRentCarList();
				int idx = 0;
				for(RentcarDTO rentcarDTO : rentcarList) {
				
					if (idx % 3 == 0) {
		%>
						<tr height="220px">
		<% 				
					}
		%>			
						<td width="333px" align="center">
							<a href="layout.jsp?body=reservation.jsp?carCd=<%=rentcarDTO.getCarCd()%>">
								<img src="../carImg/<%=rentcarDTO.getImgNm()%>" width="300" height="200">
							</a>
							<p><font size="3" color="gray"><b><%=rentcarDTO.getClassification() %> | <%=rentcarDTO.getCarNm()%></b></font>
						</td>
		<%	
					if (idx % 3 == 2) {
		%>
						</tr>
		<% 				
					}
					idx++;
				}
		%>
		</table>
	
	</div>
</body>
</html>