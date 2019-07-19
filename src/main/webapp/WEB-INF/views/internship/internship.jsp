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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.19/css/dataTables.bootstrap4.css" />    
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
	 <%@ include file="../test-admin-dashboard-header.jsp" %>
	
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:${pageContext.request.contextPath}/resources/test-admin-panel/partials/_sidebar.html -->
       <%@ include file="../test-admin-dashboard-side-nav.jsp" %>
      
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper row">
	        <div class="card">
	        	<div class="card-header">
	        		<h4>Internship Applications</h4>
	        	</div>
	        	<div class="card-body">
	        	<div class="table-responsive">
	        		<table class="table table-striped">
	        			<thead>
	        				<th>Status</th>
	        				<th>Full Name</th>
	        				<th>Email</th>
	        				<th>Contact</th>
	        				<th>University</th>
	        				<th>Course</th>
	        				<th>Sem</th>
	        				<th>City</th>
	        				<th>Applied On</th>
	        			</thead>
	        			<tbody>
	        				<c:forEach items="${ app }" var="a">
	        					<tr>
	        						<td>
	        							<c:choose>
	        								<c:when test="${ a.isHandled() }">
	        									Handled
	        								</c:when>
	        								<c:otherwise>
	        									<button title="Mark as Handled" class="btn btn-success handle-intern" id="${ a.getId() }">Mark Handled</button>
	        								</c:otherwise>
	        							</c:choose>
	        						</td>
	        						<td>${ a.getFirstName() } ${ a.getLastName() }</td>
	        						<td>${ a.getEmail() }</td>
	        						<td>${ a.getPhnNum() }</td>
	        						<td>${ a.getUniversity() }</td>
	        						<td>${ a.getCourse() }</td>
	        						<td>${ a.getSemester() }</td>
	        						<td>${ a.getCity() }</td>
	        						<td>${ a.getAppliedAt() }</td>
	        					</tr>
	        				</c:forEach>
	        			</tbody>
	        		</table>
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
    
    <!-- container-scroller -->
    
    
    
  <!-- plugins:js -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script src="${pageContext.request.contextPath}/resources/test-admin-panel/vendors/js/vendor.bundle.base.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.19/js/jquery.dataTables.min.js"></script>

<script>
$(document).ready( function () {
    $('.table').DataTable();
} );

$(document).on("click", ".handle-intern", function(e) {
	let internLetterId = $(this)[0].id;
	if (!$(this).hasClass("marked")) {
		$.ajax({
			method: "POST",
			url: "/admin/api/mark-internship-handled",
			data: {id : internLetterId},
			beforeSend: function() {
				$("#" + internLetterId).text("Marking...");
			},
			success: function(data) {
				if (data) {
					let mark = JSON.parse(data);
					if (!mark.error) {
						$("#" + internLetterId).text("Marked");
						$("#" + internLetterId).addClass("marked");
					}
					else {
						alert(mark.error_text);
					}
				}
			},
			error: function(a,xhr,b) {
				console.log(a,xhr,b);
			}
		});
	}
	else {
		alert("Already Marked");
	}
	
});
</script>   
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/js/off-canvas.js"></script>
  <!-- endinject -->
</body>

</html>
