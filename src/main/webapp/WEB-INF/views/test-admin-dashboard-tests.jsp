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
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

  
    <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.css">
    <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
  
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/vendors/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/vendors/css/vendor.bundle.addons.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.5.1/css/iziModal.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/css/spinners.css">
  
<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
 -->  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/test-admin-panel/images/favicon.png" />
<style>
	.form-control {
    border: 1px solid #f2f2f2;
    font-family: "Poppins", sans-serif;
    font-size: 0.85rem;
    padding: 0.56rem 0.75rem;
    line-height: 14px;
    font-weight: 300;
    color: #000;
}
</style>
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
		        	<c:choose>
		        		<c:when test="${ empty tests }">
		        			<h1>No Tests Present</h1>
		        		</c:when>
		        		<c:otherwise>
		        			<table class="table table-hover">
			        			<thead>
			        				<tr>
				        				<th>Test Code</th>
				        				<th>Starting Date</th>
				        				<th>Ending Date</th>
				        				<th></th>
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
									  	<td><a href="${ pageContext.request.contextPath }/admin/test-details/${ test.getCode() }"><i class="fas fa-info-circle"></i></a></td>
									  </tr>
								  </c:forEach>
							  	</tbody>
		        			</table>
		        		</c:otherwise>
		        	</c:choose>
		        		
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
  <div id="modal"> 
  	<div class="card">
  		<div class="card-header">
  			<h4>Edit Question</h4>
  		</div>
  		<div class="card-body">
  			<div class="row">
  				<div class="col-md-12">
	  				
	  				<div class="row">
	  					<div class="col-md-4">
	  						<label>Options</label>
	  						<input type="text" name="questionOptions" class="form-control" value=""/>
	  					</div>
	  					<div class="col-md-3">
	  						<label>Right Answer</label>
	  						<input type="text" name="questionAns" class="form-control" value=""/>
	  					</div>
	  				</div>
	  				<div class="row" style="margin-top: 10px;">
	  					<div class="col-md-9">
	  					<label>Question</label>
	  						  <textarea id="summernote" name="questionContent"></textarea>
	  					</div>
	  					<div class="col-md-3">
	  						<div class="col-md-12">
	  							<label>Max Marks</label>
	  							<input type="number" name="questionMaxMarks" class="form-control" />
	  						</div>
	  						<div class="col-md-12">
	  							<label>Neg Marks</label>
	  							<input type="number" name="questionNegMarks" class="form-control" />
	  						</div>
	  						<div class="col-md-12">
	  							<label for="tags">Question Tags</label>
	  							<input type="text" name="questionTag" class="form-control" value="Apptitude,Logical"/>
	  						</div>	
	  						<div class="col-md-12">
	  							<label for="set">Question Set</label>
	  							<select type="text" name="questionSet" class="form-control">
	  							</select>
	  						</div>	
	  					</div>
	  				</div>
	  					
  				</div>
  				</div>
  				
  			</div>
  			
  			<div class="card-footer text-right">
  				<button class="btn btn-danger">Delete</button>
  				<button class="btn btn-success " id="save-question">Save <i id="save-status" ></i></button>
  			</div>
  		</div>
  	</div>
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/vendors/js/vendor.bundle.base.js"></script>
  

    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.js"></script>
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.js"></script>
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.5.1/js/iziModal.min.js"></script>
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
