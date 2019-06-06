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
        	<div class="col-md-6">
        		<div class="card">
        			<div class="card-body">
        				<canvas id="test-cnv"> </canvas>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-6">
        	<div class="card" >
        		<div class="card-body">
        			<table class="table table-hover">
        				<thead>
        					<th>User</th>
        					<th>Marks/Total Marks</th>
        					<th>Submission Date</th>
        					<th></th>
        				</thead>
        				<tbody>
							  <c:forEach items="${ tusers }" var="tusers">
        						<tr>
        							<td>
        							<c:out value="${ tusers.getFirstName() } ${ tusers.getLastName() }" />
        							<%-- <c:out value="${ tusers.getUsername() }" /> --%>
        							</td>
        							<td><c:out value="${ tusers.getMarks() } / ${ tusers.getMaxMarks()}"></c:out></td>
        							<td><c:out value="${ tusers.getEndDate() }"></c:out></td>
        							<td>
	        							<a href="${ pageContext.request.contextPath }/reports/${ tusers.getTestCode()}?username=${tusers.getUsername()}">
	        								<i class="fas fa-cogs"></i>
	        							</a>
        							</td>
        						</tr>
        					</c:forEach>
        				</tbody>
        			</table>
        		</div>
        		<input type="hidden" id="test-data" value='${ data }' >
        		
        	</div></div>
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
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/vendors/js/vendor.bundle.addons.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
  
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/js/dashboard.js"></script>
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/js/test-details.js"></script>
  
  <!-- End custom js for this page-->
</body>

</html>