<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	crossorigin="anonymous">
</head>
<body>
<div class="container mt-4">
	<div class="alert alert-danger">
		<h4 class="mb-2">Request Failed</h4>
		<div><strong>Status:</strong> ${status}</div>
		<div><strong>Error:</strong> ${error}</div>
		<div><strong>Message:</strong> ${message}</div>
		<div><strong>Path:</strong> ${path}</div>
		<c:if test="${exception ne null}">
			<div><strong>Exception:</strong> ${exception}</div>
		</c:if>
	</div>

	<c:if test="${trace ne null}">
		<div class="card">
			<div class="card-header">Stacktrace</div>
			<div class="card-body">
				<pre style="white-space: pre-wrap;">${trace}</pre>
			</div>
		</div>
	</c:if>
</div>
</body>
</html>

