<%@ page contentType="text/html; charset = UTF-8"%>
<html>
<head>
<title>Welcome Admin</title>
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" />
</head>

<body>
	<%@include file="header.jsp"%>
	<h2>${message}</h2>
	Admin
	<%@include file="footer.jsp"%>
</body>
</html>