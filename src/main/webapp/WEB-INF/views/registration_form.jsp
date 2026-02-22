<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Crop insurance application</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          crossorigin="anonymous">
</head>

<body>

<div class="container mt-1">

    <c:if test="${msg ne null}">
        <div class="alert alert-success">${msg}</div>
    </c:if>

    <c:if test="${error ne null}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <div class="card">
        <div class="card-header bg-primary text-white">
            Crop Insurance Form
        </div>

        <div class="card-body">

            <form id="InsuranceApplication" action="/insurance/save" method="post">

                <!-- Season & Crop -->
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label>Season <span class="text-danger">*</span></label>
                        <select name="season.seasonId"
                                id="seasonId"
                                class="form-control"
                                required>
                            <option value="">-Select-</option>
                            <c:forEach items="${seasons}" var="s">
                                <option value="${s.seasonId}">
                                    ${s.seasonName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label>Crop Name <span class="text-danger">*</span></label>
                        <select name="crop.cropId"
                                id="cropId"
                                class="form-control"
                                required>
                            <option value="">-Select-</option>
                        </select>
                    </div>
                </div>

                <!-- Farmer Details -->
                <div class="row">

                    <div class="col-md-6 mb-3">
                        <label>Farmer Name <span class="text-danger">*</span></label>
                        <input type="text"
                               name="farmerName"
                               class="form-control"
                               maxlength="50"
                               required>
                        <small class="text-secondary">
                            Max 50 characters, No special characters
                        </small>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label>Aadhaar No <span class="text-danger">*</span></label>
                        <input type="text"
                               name="aadhaarNo"
                               class="form-control"
                               pattern="[0-9]{12}"
                               title="12 digits exactly"
                               required>
                        <small class="text-secondary">
                            Exactly 12 digits, Numbers only
                        </small>
                    </div>

                </div>

                <!-- Father Name + Farmer Category (Same Row) -->
                <div class="row">

                    <div class="col-md-6 mb-3">
                        <label>Father Name <span class="text-danger">*</span></label>
                        <input type="text"
                               name="fatherName"
                               class="form-control"
                               maxlength="12"
                               required>
                        <small class="text-secondary">
                            Max 12 characters, Alphanumeric only
                        </small>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label>
                            Farmer Category
                            <span class="text-danger">*</span>
                        </label>
                        <br>

                        <div class="form-check">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input"
                                       type="radio"
                                       name="farmerCategory"
                                       value="Small"
                                       required>
                                Small
                            </div>

                            <div class="form-check form-check-inline">
                                <input class="form-check-input"
                                       type="radio"
                                       name="farmerCategory"
                                       value="Medium">
                                Medium
                            </div>

                            <div class="form-check form-check-inline">
                                <input class="form-check-input"
                                       type="radio"
                                       name="farmerCategory"
                                       value="Large">
                                Large
                            </div>
                        </div>
                    </div>

                </div>

                <!-- Address -->
                <div class="row">
                    <div class="col-md-8 mb-3">
                        <label>Complete Address <span class="text-danger">*</span></label>
                        <textarea name="address"
                                  class="form-control"
                                  maxlength="250"
                                  required>
                        </textarea>
                        <small class="text-secondary">
                            Max 250 characters, No special characters
                        </small>
                    </div>
                </div>

                <div class="m-1">
                    <input type="submit" class="btn btn-success" value="Save">
                    <input type="reset" class="btn btn-warning" value="Reset">
                </div>

            </form>

        </div>
    </div>

</div>

<div class="h3 text-center text-warn">
    Click <a href="/insurance/view"> here </a> to view insurance applications
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    $("#seasonId").change(function () {
        $.ajax({
            url: "/insurance/getCrops",
            data: { seasonId: $(this).val() },
            success: function (res) {
                let cropSelect = $("#cropId");
                cropSelect.empty()
                          .append('<option value="">-Select-</option>');

                res.forEach(crop => {
                    cropSelect.append(
                        '<option value="' + crop.cropId + '">' +
                        crop.cropName +
                        '</option>'
                    );
                });
            }
        });
    });
</script>

</body>
</html>