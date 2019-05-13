<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Admin Dashboard</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/vendors/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/vendors/css/vendor.bundle.addons.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/css/spinners.css">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">  
<!-- endinject -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/test-admin-panel/images/favicon.png" />
</head>

<body>
  <div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
    <%@ include file="test-admin-dashboard-header.jsp" %>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:../../partials/_sidebar.html -->
      
      <%@ include file="test-admin-dashboard-side-nav.jsp" %>
      
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
        <div class="row purchace-popup" id="status-contain">
            <div class="offset-md-2 col-8">
              <span class="d-flex align-items-center justify-content-between">
                <p id="status-text"></p>
                <i class="mdi mdi-close popup-dismiss"></i>
              </span>
            </div>
          </div>
        	<div class="row">
        		<div class="offset-md-2 col-md-8 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Test Details</h4>
                  
                    <form method="post" id="test-form" class="forms-sample" > 
                    <div class="row">
                    	<div class="col-md-8">
                    		 <div class="form-group">
		                      <label for="exampleInputName1">Test Title</label>
		                      <input type="text" class="form-control" name="name" placeholder="Title..." required>
		                      <input type="text" class="form-control" name="testId" value="${ testId }" required style="display:none">
		                      <input type="text" class="form-control" name="admin" value="${ userId }" required style="display:none">
		                      <input type="number" class="form-control" name="totalTime" value="0" required style="display:none">
		                      
		                      <input type="text" class="form-control" name="filePath" value="filepath" required style="display:none">
		                    </div>
                    	</div>
                    	<div class="col-md-4">
                    		<div class="form-group">
                    		<label for="program-name">Associated Program</label>
	                    		<select name="courseCode" class="form-control" required>
	                    			<option selected disabled>Choose a Program</option>
			              			<c:forEach items="${programs}" var="program">
									     <option value="${ program.programCode }">${ program.programName }</option>
									</c:forEach>
			              		</select> 
		              		</div>
                    	</div>
                    </div> 
                   
                    <div class="row">
                    	<div class="col-md-6">
	                    	<div class="form-group">
		                      <label for="exampleInputEmail3">Test Code</label>
		                      <input type="text" class="form-control" name="code" placeholder="Test Code..." required>
	                    	</div>
                    	</div>
                    	<div class="col-md-6">
                    		<div class="form-group">
		                      <label for="exampleInputPassword4">Test Password</label>
		                      <input type="password" class="form-control" name="password" placeholder="Password" required>
		                    </div>
                    	</div>
                    </div>
                    <div class="row">
                    	<div class="col-md-4">
	                    	<div class="form-group">
		                      <label for="exampleInputEmail3">Test Start Date</label>
		                      <input type="datetime-local" id="test-start-time" class="form-control" name="startTime" required>
	                    	</div>
                    	</div>
                    	<div class="col-md-4">
                    		<div class="form-group">
		                      <label for="exampleInputPassword4">Test End Date</label>
		                      <input type="datetime-local" id="test-end-time" class="form-control" name="endTime" required>
		                    </div>
                    	</div>
                    	<div class="col-md-4">
                    		<div class="form-group">
		                      <label for="exampleInputPassword4">Total Time</label>
		                      <div class="d-flex">
			                      <input type="number" class="form-control col-md-5" style="height:100%;" name="totalTimeHours" placeholder="in hours..." required>
			                      <input type="number" class="form-control col-md-6" style="height:100%;margin-left: 10px !important;" name="totalTimeMinutes" placeholder="in minutes..." required>
		                      </div>
		                    </div>
                    	</div>
                    </div>
                    <div class="form-group">
	                    <label>Time Strict</label>	
	                    <div class="d-flex justify-content-around">
	                      <div class="form-radio form-radio-flat">
	                        <label class="form-check-label">
	                          <input type="radio" class="form-check-input" name="isTimeStrict" value="1" checked> Make time strict
	                        <i class="input-helper"></i></label>
	                      </div>
	                      <div class="form-radio form-radio-flat">
	                       <label class="form-check-label">
	                         <input type="radio" class="form-check-input" name="isTimeStrict" value="0"> Don't make time strict
	                       <i class="input-helper"></i></label>
	                      </div>
	                     </div>
                    </div>
                    <div class="form-group">
	                    <label>Answer Shuffle</label>	
	                    <div class="d-flex justify-content-around">
	                      <div class="form-radio form-radio-flat">
	                        <label class="form-check-label">
	                          <input type="radio" class="form-check-input" name="isAnsShuffle" id="flatRadios1" value="1" checked=""> Shuffle Options
	                        <i class="input-helper"></i></label>
	                      </div>
	                      <div class="form-radio form-radio-flat">
	                       <label class="form-check-label">
	                         <input type="radio" class="form-check-input" name="isAnsShuffle" id="flatRadios2" value="0"> Don't Shuffle Options
	                       <i class="input-helper"></i></label>
	                      </div>
	                     </div>
                    </div>
                    
                    <div class="form-group">
                      <label>Questions File upload</label>
                      <input type="file" id="upload-btn-real" name="file" class="file-upload-default" required>
                      <div class="input-group col-xs-12">
                        <inp=]lbvdut type="text" class="form-control file-upload-info" id="file-name"  placeholder="Upload Image">
                        <span class="input-group-append">
                          <button class="file-upload-browse btn btn-info" id="upload-btn-fake" type="button">Upload</button>
                        </span>
                      </div>
                    </div>
                    <script>
                    	let fakeBtn = document.getElementById('upload-btn-fake');
                    	let realBtn = document.getElementById('upload-btn-real');
                    	let fileBox = document.getElementById('file-name');
                    	fakeBtn.addEventListener('click',function() {
                    		realBtn.click();
                    	})
                    	realBtn.addEventListener('change', function(){
                    		fileBox.value = realBtn.value.split("\\").pop();
                    	})
                    </script>
                    
                    <button class="btn btn-success mr-2" id="add-save-test">
                    	Submit
                    	<i class="fa fa-arrow-right" id="status"></i>
                    </button>
                    <button class="btn btn-light">Cancel</button>
                  </form>
                </div>
              </div>
            </div>
        	</div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:../../partials/_footer.html -->
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
      <script src="https://cdnjs.cloudflare.com/ajax/libs/izimodal/1.5.1/js/iziModal.min.js"></script>
  
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/js/off-canvas.js"></script>
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/js/misc.js"></script>
  <script src="${pageContext.request.contextPath}/resources/test-admin-panel/js/features.js"></script>
  
  <!-- endinject -->
  <!-- Custom js for this page-->
  <!-- End custom js for this page-->
</body>

</html>
