<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>applications</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>

<body>

<div class="container mt-4">

<c:if test="${msg ne null}">
			<div id="alertId" class="alert alert-success">
				<span class="font-weight-bold">Message : </span> ${msg}
			</div>
</c:if>

		<div class="h3 text-primary mt-2">Crop Insurance Applications</div>


<div>

<table class="table table-bordered table-striped mt-4">
    <thead class="thead-dark">
        <tr>
        <th>Sl.#</th>
            <th>Farmer Name</th>
            <th>Aadhaar</th>
            <th>Season</th>
            <th>Crop</th>
            <th>Category</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${applications}" var="app" varStatus="counter">
            <tr>
            	<td>${counter.count}</td>
                <td>${app.farmerName}</td>
                <td>${app.aadhaarNo}</td>
                <td>${app.season.seasonName}</td>
                <td>${app.crop.cropName}</td>
                <td>${app.farmerCategory}</td>
                <td>
                    <a href="/insurance/delete?id=${app.farmerId}" class="btn btn-danger btn-sm"
                       onclick="return confirm('Delete this record?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</div>
	<div class="h4 text-warn m-2">
		Click <a href="/insurance/apply"> here </a> to apply for crop insurance
	</div>
</div>

<script src="https://code.jquery.com/jquery-2.2.4.js"
		integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
		crossorigin="anonymous"></script>
	<script>
    document.addEventListener("DOMContentLoaded", function(event){
        var al=document.querySelector("#alertId");
        if(al != null){
            setTimeout(() => {
                al.remove();
            }, 3000);
        }
    });
</script>

</body>
</html>

