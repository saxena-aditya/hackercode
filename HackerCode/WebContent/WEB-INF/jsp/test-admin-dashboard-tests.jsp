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
	        <div class="card col-md-6">
		        <div class="card-body">
		        	<div class="table-responsive">
		        		<table class="table table-hover">
		        			<thead>
		        				<tr>
			        				<th>Test Code</th>
			        				<th>Starting Date</th>
			        				<th>Ending Date</th>
		        				</tr>
		        			</thead>
		        			<tbody>
							  <c:forEach items="${ tests }" var="test">
								  <c:set value="${ test.getStartTime() }" var="startTime" />
							  	  <c:set value="${ test.getEndTime() }" var="endTime" />
							  	  <fmt:parseDate value="${endTime}" var="endTime" pattern="yyyy-MM-dd HH:mm:ss" />
								  <fmt:parseDate value="${startTime}" var="startTime" pattern="yyyy-MM-dd HH:mm:ss" />
								  <tr id="label-${ test.getTestId() }">
								  	<td><a href="#" id="question-get-${ test.getTestId() }">${ test.getCode() }</a></td>
								  	<td><fmt:formatDate value="${ startTime }" pattern="dd/MM/yyyy HH:mm" /></td>
								  	<td><fmt:formatDate value="${ endTime }" pattern="dd/MM/yyyy HH:mm" /></td>
								  </tr>
							  </c:forEach>
						  	</tbody>
		        		</table>
		        	</div>
	        	</div>
        	</div>
        	<div class=" card col-md-6">
        		<div class="card">
        			<div class="card-body">
        				<div class="table-responsive">
        					<table class="table table-striped">
        						<thead>
        							<tr>
        								<th>Question</th>
        								<th>Set</th>
        								
        							</tr>
        						</thead>
        						<tbody id="test-questions">
        						</tbody>
        					</table>
        				</div>
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
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/vendors/js/vendor.bundle.base.js"></script>
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/vendors/js/vendor.bundle.addons.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/js/off-canvas.js"></script>
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/js/misc.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <!-- End custom js for this page-->
</body>

</html>
