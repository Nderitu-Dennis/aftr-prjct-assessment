<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Crop insurance application </title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	crossorigin="anonymous">
</head>
<body>

<div class="container mt-5">
		<!-- Success n error Message -->
    <c:if test="${msg ne null}"><div class="alert alert-success">${msg}</div></c:if>
    <c:if test="${error ne null}"><div class="alert alert-danger">${error}</div></c:if>

    <div class="card">
        <div class="card-header bg-primary text-white">Crop Insurance Form</div>
        <div class="card-body">

            <form action="<c:url value='/insurance/save'/>" method="post">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label>Season</label>
                        <select name="season.seasonId" id="seasonId" class="form-control" required>
                            <option value="">-Select-</option>
                            <c:forEach items="${seasons}" var="s">
                                <option value="${s.seasonId}">${s.seasonName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label>Crop Name</label>
                        <select name="crop.cropId" id="cropId" class="form-control" required>
                            <option value="">-Select-</option>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label>Farmer Name</label>
                        <input type="text" name="farmerName" class="form-control" maxlength="50" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label>Aadhaar No</label>
                        <input type="text" name="aadhaarNo" class="form-control" pattern="[0-9]{12}" title="12 digits exactly" required>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 mb-3">
                        <label>Farmer Category</label><br>
                        <input type="radio" name="farmerCategory" value="Small" required> Small
                        <input type="radio" name="farmerCategory" value="Medium"> Medium
                        <input type="radio" name="farmerCategory" value="Large"> Large
                    </div>
                    <div class="col-md-8 mb-3">
                        <label>Complete Address</label>
                        <textarea name="address" class="form-control" maxlength="250" required></textarea>
                    </div>
                </div>

                <button type="submit" class="btn btn-success">Submit</button>
                <button type="reset" class="btn btn-warning">Clear</button>
            </form>

        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    // AJAX for Dynamic Dropdown
    $("#seasonId").change(function() {
        $.ajax({
            url: "/insurance/getCrops",
            data: { seasonId: $(this).val() },
            success: function(res) {
                let cropSelect = $("#cropId");
                cropSelect.empty().append('<option value="">-Select-</option>');
                res.forEach(crop => {
                    cropSelect.append('<option value="'+crop.cropId+'">'+crop.cropName+'</option>');
                });
            }
        });
    });
</script>
</body>
</html>
