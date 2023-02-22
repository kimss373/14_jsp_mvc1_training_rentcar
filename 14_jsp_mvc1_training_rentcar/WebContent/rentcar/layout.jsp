<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>layout</title>
</head>
<body>

	<div align="center">
		
		<%
			String body = request.getParameter("body");
		
			if (body == null) {
				body = "body.jsp";	
			}
		%>
		
		<table>
		
			<%-- top(상단_고정) --%>
			<tr height="120px" align="center">
				<td width="1000px">
					<jsp:include page="header.jsp" />
				</td>
			</tr>
			
			<%-- body(각 페이지를 불러올 부분) --%>
			<tr align="center">
				<td>
					<jsp:include page="<%=body%>" />
				</td>
			</tr>
			
			<%-- bottom(하단_고정) --%>
			<tr align="center" height="100px">
				<td>
					<jsp:include page="footer.jsp" />
				</td>
			</tr>
			
		</table>
		
	</div>

</body>
</html>