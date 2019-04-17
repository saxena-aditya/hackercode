<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HackerCode || File Upload</title>
</head>
<body>
<c:url value="${fileUploadURL }" var="uploadFileUrl" />

	<form method="post" enctype="multipart/form-data"
	  action="${uploadFileUrl}">
	    <input type="file" name="file" accept=".xls,.xlsx" /> <input
	      type="submit" value="Upload file" />
	</form>
	${val}
</body>
</html>