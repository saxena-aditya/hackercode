<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
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
      <div class="main-panel">
        <div class="content-wrapper row">
          
          <div class="card col-md-9">
          	<div class="card-header">
          		Pending Articles
          	</div>
          		<div class="card-body">
	          		<div class="table-responsive">
	          			<table class="table table-striped">
	          				<thead>
	          					<th>Name</th>
	          					<th>UserName</th>
	          					<th>Article Title</th>
	          					<th>Category > Sub-Category</th>
	          				</thead>
	          				<tbody>
	          					<c:forEach items="${ notApprovedArticles }" var="article">
	          						<tr>
	          							<td><button class="btn btn-success s-btn approve" id="article-${ article.getId() }"><i class="fas fa-check-circle" id="status-${ article.getId() }"></i></button></td>
	          							<td>${ article.getName() }</td>
	          							<td>${ article.getUserName() }</td>
	          							<td><a href="/admin/articles/review/${ article.getId_hash() }">${ article.getTitle() }</a></td>
	          							<td>${ article.getCategory() } > ${ article.getSubCategory() }</td>
	          							
	          						</tr>
	          					</c:forEach>
	          				</tbody>
	          			</table>
          			</div>
          		</div>
          </div>
          <div class="col-md-3">
          	<div class="card">
          		<div class="card-header">
          			Approved Article
          		</div>
          		<div class="table-responsive">
          			<table class="table table-striped">
          				<thead>
          					<th>User Name</th>
          					<th>Title</th>
          				</thead>
          				<tbody>
          					<c:forEach items="${ approvedArticles }" var="article">
          						<tr>
          							<td>${ article.getUserName() }</td>
          							<td>${ article.getTitle() }</td>
          						</tr>
          					</c:forEach>
          				</tbody>
          			</table>
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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.7/js/select2.full.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/js/iziToast.min.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <!-- End plugin js for this page-->
  <!-- inject:js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.5.1/js/iziModal.min.js"></script>
    <script src="https://sdk.amazonaws.com/js/aws-sdk-2.452.0.min.js"></script>
  
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/js/off-canvas.js"></script>
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/js/article-admin.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/js/dashboard.js"></script>
  <!-- End custom js for this page-->
</body>
<script>
	
	
</script>
</html>