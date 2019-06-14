<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Star Admin Free Bootstrap-4 Admin Dashboard Template</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/vendors/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/vendors/css/vendor.bundle.addons.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.5.1/css/iziModal.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/css/spinners.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/css/add-courses.css">
    
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    
   <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/test-admin-panel/images/favicon.png" />
</head>

<body>
  <div class="container-scroller">
    <!-- partial:${pageContext.request.contextPath}/resources/test-admin-panel/partials/_navbar.html -->
	 <%@ include file="test-admin-dashboard-header.jsp" %>
	
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:${pageContext.request.contextPath}/resources/test-admin-panel/partials/_sidebar.html -->
       <%@ include file="test-admin-dashboard-side-nav.jsp" %>
      
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper row">
	        
	        <div class="col-md-6">
                <div class="card" style="padding: 20px;">
                    <div class="card body" id="rs-body">
                        <div class="row" id="rs-0">
                            <div class="col-md-12">
                                <div class="form-group">
	                                <div class="row">
	                                    <div class="col-md-8">
	                                        <label for="">Resource Title</label>
	                                        <input type="text" class="rs-name form-control" id="rs-title-0">
	                                    </div>
	                                    <div class="col-md-4">
	                                        <label for="">Resource File</label>
	                                        <input type="file" class="rs-file form-control" id="rs-file-0">
	                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="btn-arr text-right">
                        <button class="upload-rs add-entity">Upload <i class="fas fa-check"></i></button>
                        <button class="add-rs add-entity" id="ls-add">Add More <i class="fas fa-plus"></i></button>
                    </div>
                </div>
                <div id="status">
                        
                </div>
                <div class="progress" style="margin: 30px; display:none">
                  <div class="progress-bar progress-bar-striped active" role="progressbar"
                  aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" id="bar-progress">
                    <span id="percent-progress"></span>%
                  </div>
                </div>
            </div>
        	
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:${pageContext.request.contextPath}/resources/test-admin-panel/partials/_footer.html -->
        <footer class="footer">
          <div class="container-fluid clearfix">
            <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © 2018
              <a href="http://www.bootstrapdash.com/" target="_blank">Bootstrapdash</a>. All rights reserved.</span>
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
  <!-- plugins:js -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  <script src="https://sdk.amazonaws.com/js/aws-sdk-2.452.0.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/vendors/js/vendor.bundle.base.js"></script>
  
      
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/js/off-canvas.js"></script>
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/js/rs-upload.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <!-- End custom js for this page-->
</body>

</html>
