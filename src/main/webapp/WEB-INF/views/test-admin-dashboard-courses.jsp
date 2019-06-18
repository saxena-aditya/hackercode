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
  <title>Star Admin Free Bootstrap Admin Dashboard Template</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

  
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/vendors/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/vendors/css/vendor.bundle.addons.css">
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
    <!-- partial:partials/_navbar.html -->
    <%@ include file="test-admin-dashboard-header.jsp" %>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_sidebar.html -->
      <%@ include file="test-admin-dashboard-side-nav.jsp" %>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
        <div class="row">
        	<div class="col-md-12">
        		<div class="card">
        			<div class="card-header">
        				 <h5>Your Courses</h5>
        			</div>
        			<div class="card-body">
        				<table class="table table-striped">
        					<thead>
        						<th>Title</th>
        						<th>Price (Rs.)</th>
        						<th>Validity (days)</th>
        						<th>Enrolled </th>
        					</thead>
        					<tbody>
        						<c:forEach items="${ courses }" var="c">
        							<tr>
        								<td><span> <a class="edit-cr" title="Edit Course" href="/admin/courses/edit/${ c.getCode() }"><i class="mdi mdi-tooltip-edit"></i></a><span>${ c.getName() }</span></span></td>
        								<td><strike>${ c.getMrp() }</strike> / ${ c.getPrice() }</td>
        								<td>${ c.getDays() }</td>
        							</tr>
        						</c:forEach>
        					</tbody>
        				</table>
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

  <!-- plugins:js -->
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/vendors/js/vendor.bundle.base.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
  
  
  <!-- End custom js for this page-->
</body>

</html>