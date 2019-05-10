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

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/css/add-courses.css">
  
  <!-- endinject -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/test-admin-panel/images/favicon.png" />
</head>

<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <%@ include file="test-admin-dashboard-header.jsp" %>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_sidebar.html -->
      <%@ include file="test-admin-dashboard-side-nav.jsp" %>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper row">
          <div class="course-wrapper col-md-7">
          <div class="card">
          <button class="save-course">Save</button>
          	<div class="card-body">
          		<div class="course-head" id="course-head">
	          		<label for="">Course Title</label>
	          		<input type="text" id="c-title" class="form-control" placeholder="Introduction to Python..." name="title" />
          		</div>
          		<div class="course-body">
          		<div id="chapter-container">
          			
          			
          			
          		</div>
          		
          		</div>
          	</div>
          	<div class="d-flex justify-content-end">
          				<button class="add-entity" id="ch-add">Chapter <i class="mdi mdi-plus"></i></button>
          				<button class="add-entity" id="ls-add">lesson <i class="mdi mdi-plus"></i></button>
          		</div> 
          </div>
          	
          </div>
          <div class="col-md-5">
          	<div class="card">
          		<div class="card-body">
          			<div class="form-group">
	          			<label for="">Course Description</label>
	          			<textarea name="" id="c-desc" cols="30" rows="10" class="form-control" name="desc"></textarea>
          			</div>
          			<div class="form-group row">
          				<div class="col-md-6">
          					<label for="">Price</label>
          					<input type="number" id="p-price" class="form-control" name="price" />
          				</div>
          				<div class="col-md-6">
          					<label for="">Validity Days</label>
          					<input type="number" id="d-days" class="form-control" name="totalDays" />
          				</div>
          			</div>
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
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <!-- End plugin js for this page-->
  <!-- inject:js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.5.1/js/iziModal.min.js"></script>
  
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/js/off-canvas.js"></script>
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/js/chapter-add.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/js/dashboard.js"></script>
  <!-- End custom js for this page-->
</body>
<script>
	
	
</script>
</html>