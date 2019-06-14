<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Star Admin Free Bootstrap Admin Dashboard Template</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/vendors/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/vendors/css/vendor.bundle.addons.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/css/iziToast.min.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.7/css/select2.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/css/add-courses.css">
  
  <!-- endinject -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/test-admin-panel/images/favicon.png" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/css/iziToast.min.css" />
</head>

<body>
<style>
	.lesson-container, .resource-inp {
    margin-left: 5%;
    margin-bottom: 2%;
    margin-top: 2%;
    max-width: -webkit-fill-available;
}
</style>
<div id="placeholder"></div>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <%@ include file="test-admin-dashboard-header.jsp" %>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_sidebar.html -->
      <%@ include file="test-admin-dashboard-side-nav.jsp" %>
      <!-- partial -->
      <input type="hidden" id="courseData" value = '${ courseData }'/>
      <div class="main-panel">
        <div class="content-wrapper row">
          
          <div class="card col-md-7">
          		<div class="card-header edit-header">
          			Edit Course:
          			<button id="save-course" class="btn btn-success">Update</button>
          			<button class="btn btn-danger cr-del" id="${ courseCode }">Delete Course</button>
          		</div>
          		<div class="card-body edit-body">
          		<div class="progress-container" style="display: none;">
          	<div id="status">
                      
                </div>
                <div class="progress">
                  <div class="progress-bar progress-bar-striped active" role="progressbar"
                  aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" id="bar-progress">
                    <span id="percent-progress"></span>%
                  </div>
                </div>
          </div>
          			<div id="course-container"></div>
          		</div>
          </div>
          <div class="col-md-5">
          	<div class="card-header">
          		Course Details
          	</div>
          	<div class="card-body">
          		<div id="course-details-container" class="row"  >
          		</div>
          	</div>
          </div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
        <footer class="footer">
          <div class="container-fluid clearfix">
            <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © 2018
              <a href="${pageContext.request.contextPath}/resources/test-admin-panel/http://www.bootstrapdash.com/" target="_blank">Bootstrapdash</a>. All rights reserved.</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with
              <i class="mdi mdi-heart text-danger"></i>
            </span>
          </div>
        </footer>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/js/iziToast.min.js"></script>
  <!-- plugins:js -->
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/vendors/js/vendor.bundle.base.js"></script>
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/vendors/js/vendor.bundle.addons.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.7/js/select2.full.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/js/iziToast.min.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <!-- End plugin js for this page-->
  <!-- inject:js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.5.1/js/iziModal.min.js"></script>
    <script src="https://sdk.amazonaws.com/js/aws-sdk-2.452.0.min.js"></script>
  
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/js/off-canvas.js"></script>
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/js/course-edit.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/js/dashboard.js"></script>
  <!-- End custom js for this page-->
</body>
<script>
	
	
</script>
</html>