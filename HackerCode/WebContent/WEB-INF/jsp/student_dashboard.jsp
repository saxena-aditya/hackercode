<%@ page contentType="text/html; charset = UTF-8"%>
<html>
<head>
<title>Welcome Page</title>
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" />
</head>

<body>

	<form action="addFields.rpc?user=${user}&id=103" method="post">

		<input type="submit" />
	</form>

</body>
</html>