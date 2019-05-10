<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.*" %>  
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
 <%
 	Random randomGenerator = new Random();
	int randomInt = randomGenerator.nextInt(1000000);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Course Details</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="" content="">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loading-btn/loading.css">
	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loading-btn/loading-btn.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/course-details.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/float-login-form.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">

<link rel="stylesheet" href="https://cdn.plyr.io/3.5.3/plyr.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js" type="text/javascript"></script>
</head>
<body>
<section>
	<nav class="navbar navbar-expand-lg navbar-light">
	  <a class="navbar-brand" href="${pageContext.request.contextPath}">
	  	<img src="${pageContext.request.contextPath}/resources/ff-ideas/logo.png" id="owl-graph" alt="">
	  </a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarNavDropdown">
	    <ul class="navbar-nav ml-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="${ pageContext.request.contextPath }" id="home-alt">Home <span class="sr-only">(current)</span></a>
	      </li>
	      
	      
	      <c:choose>
			    <c:when test="${ doLogin == 1}">
			         <li class="nav-item">
				        <a class="nav-link sign-in-btn" href="${ pageContext.request.contextPath }/signup">Register</a>
				     </li>
				     <li class="nav-item">
				        <a class="nav-link sign-up-btn" href="#" data-toggle="modal" data-target="#login-modal" href="#">Login</a>
				     </li>
			    </c:when>    
			    <c:otherwise>
			    	<li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          Options <i class="fas fa-cog"></i>
				        </a>
				        
				        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
				         <a class="dropdown-item" href="${ pageContext.request.contextPath }/profile">View Dashboard</a>
				          <a class="dropdown-item" href="${ pageContext.request.contextPath }/logout">logout</a>
				        </div>
				      </li>
			    </c:otherwise>
			</c:choose>
	    </ul>
	  </div>
	</nav>
</section>
<section id="start-alt">
	<div class="row" style="margin: 0">
		<div class="col-md-7">
			<div class="course-heading">
			
				<div class="background-stage">
					<div class="course ld-over" id="course-type--bar">
					    <div class="ld ld-ring ld-spin"></div>
					
						<p class="name">
							<c:out value="${course.getName() }" />
							<span id="code"><c:out value="${course.getCode()}" /></span>
						</p>
						
						<div class="course-type-bar d-flex justify-content-start">
                        	<div class="inf">Web Development</div>
	                     </div>
						<div class="ratings">
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
						</div>
						
                        <div class="course-info-bar d-flex justify-content-between">
                        
	                        <div class="info d-flex">
	                            <div class="time inf">
	                                <i class="far fa-clock sm-icon"></i>
	                                <c:out value="${course.getTotalDays()} days"/>
	                    
	                            
	                            </div>
	                            <div class="lectures inf">
	                                <i class="far fa-play-circle sm-icon"></i>
	                                <span id="top-lec-num"></span> lectures
	                    
	                            
	                            </div>
	                            <div class="level inf">
	                                <i class="fas fa-level-up-alt"></i>
	                                beginner
	  							</div>
	                      </div>
	                      <div class="price-info d-flex">
	                      	<div class="was-price">
	                      		<i class="fas fa-rupee-sign"></i> 1200
	                      	</div>
	                      	<div class="is-price">
	                      		<i class="fas fa-rupee-sign"></i>${course.getPrice()}
	                      	</div>
	                      </div>
                      </div>
					</div>
				</div>
				
			</div>
			<div class="course-desc">
				<div class="desc-heading">
					<h3>Description</h3>
					<div class="bb-bar"></div>
					
				</div>
				<div class="para" id="course-desc">
				
				</div>
				<span id="course-desc-h" style="display:none">
					<c:out value="${course.getDesc()}" />
				</span>
			</div>
			<div class="course-desc-pad ld-over" id="status-arr">
			<div class="ld ld-ring ld-spin"></div>
			
				<div class="desc-heading">
						<h3>Course Route</h3>
						<div class="bb-bar"></div>		
				</div>
				<div class="para">
					<ul class="tree" id="lesson-tree">
						<!-- <li class="container tree-leaf"><p>Introduction to Python </p>
							<ul class="tree">
								<li class="tree-leaf"><p class="tree-r d-flex justify-content-between"><span><i class="far fa-play-circle"></i> Python Basics</span><span>23 mins</span></p></li>
								<li class="tree-leaf"><p class="tree-r d-flex justify-content-between"><span><i class="far fa-play-circle"></i> Indentation and Spaces</span><span>13 mins</span></p></li>
								<li class="tree-leaf"><p class="tree-r d-flex justify-content-between"><span><i class="far fa-play-circle"></i> Python Basics</span><span>23 mins</span></p>
									
								</li>
							</ul>
						</li>
						<li class="container tree-leaf"><p>Testing </p>
							<ul class="tree">
								<li class="tree-leaf"><p><i class="far fa-play-circle"></i> Testing 1</p></li>
								<li class="tree-leaf"><p><i class="far fa-play-circle"></i> Testing 2</p></li>
								<li class="tree-leaf"><p><i class="far fa-play-circle"></i> Testing 3</p></li>
							</ul>
						</li>
						<li class="container tree-leaf"><p>Testing </p>
							<ul class="tree">
								<li class="empty tree-leaf"><p>empty</p></li>
							</ul>
						</li> -->
					</ul>
					
				</div>
			</div>
		</div>
		<div class="col-md-5">
			<div class="intro-video">
				<video class="plyr">
					<source src="http://do4k6lnx3y4m9.cloudfront.net/SampleVideo_1280x720_2mb.mp4"></source>
				</video>
			</div>
			<div id="sticky-anchor"></div>
			<div class="catalogue" id="sticky">
				<div class="card">
					<div class="card-body d-flex ">
						<div class="course-img">
							<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNKM_kz1xIlkm3gZKl39n3-EKRg3jQtM-Q9u6qBBBafQ6tL2Jj9g" alt="" />
						</div>
						<div class="left">
							<div class="buy-now-btn">
							<c:choose>
							    <c:when test="${ doLogin == 1}">
							        <a href="#" data-toggle="modal" data-target="#login-modal" class="buy-now" >Buy Now</a>
							    </c:when>    
							    <c:otherwise>
							    	<a href="#" class="buy-now" id="order">Buy Now</a>
							    </c:otherwise>
							</c:choose>
							
							</div>
							<div class="course-dd">
								<div class="heading-small">This Course Includes</div>
								<ul>
									<li><i class="fas fa-play-circle"></i> <span id="lec-num">33</span> Lectures</li>
									<li><i class="fas fa-clock"></i> <span id="lec-hrs"></span> Mins worth study material</li>
									<li><i class="fas fa-calendar-day"></i> ${ course.getTotalDays() } Days for access</li>
									<li><i class="fas fa-vial"></i> Practice Test Series</li>
									<li><i class="fas fa-certificate"></i> Certificate on successful completion</li>
									<li><c:out value="${doLogin} logged"/></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<div class="modal" id="login-modal">
  <div class="modal-dialog">
    <div class="modal-content">

     <div class="container-scroller">
    <div class="page-body-wrapper full-page-wrapper auth-page">
      <div class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">
        <div style="width: 100%;">
          <div class="mx-auto">
            <div class="auto-form-wrapper">
              <form action="${pageContext.request.contextPath}/login?course=${course.getCode()}" method="POST">
                <div class="form-group">
                  <label class="label">Username</label>
                  <div class="input-group">
                    <input type="text" name="username" class="form-control" placeholder="Username">
                    <div class="input-group-append">
                      <span class="input-group-text">
                        <i class="fas fa-user"></i>
                      </span>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="label">Password</label>
                  <div class="input-group">
                    <input type="password" name="password" class="form-control" placeholder="*********">
                    <div class="input-group-append">
                      <span class="input-group-text">
                        <i class="fas fa-key"></i>
                      </span>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <button class="btn btn-primary submit-btn btn-block">Login</button>
                </div>
                <div class="form-group d-flex justify-content-between">
                  <div class="form-check form-check-flat mt-0">
                    <label class="form-check-label">
                      <input type="checkbox" class="form-check-input" checked> Keep me signed in
                    </label>
                  </div>
                  <a href="#" class="text-small forgot-password text-black">Forgot Password</a>
                </div>
                <div class="form-group">
                  <button class="btn btn-block g-login">
                    <img class="mr-3" src="${pageContext.request.contextPath}/resources/test-admin-panel/images/file-icons/icon-google.svg" alt="">Log in with Google</button>
                </div>
                <div class="text-block text-center my-3">
                  <span class="text-small font-weight-semibold">Not a member ?</span>
                  <a href="${ pageContext.request.contextPath }/signup?course=${course.getCode()}" class="text-black text-small">Create new account</a>
                </div>
              </form>
            </div>
            <ul class="auth-footer">
              <li>
                <a href="#">Conditions</a>
              </li>
              <li>
                <a href="#">Help</a>
              </li>
              <li>
                <a href="#">Terms</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
    </div>
  </div>
</div>
<section style="display:none;">
	<h1>Merchant Check Out Page</h1>
	<pre>
	</pre>
	<form method="post" action="/WebHackerCode/courses/${course.getCode()}/payment/redirect">
		<table border="1">
			<tbody>
				<tr>
					<th>S.No</th>
					<th>Label</th>
					<th>Value</th>
				</tr>
				
				<tr>
					<td>2</td>
					<td><label>CUSTID ::*</label></td>
					<td><input id="CUST_ID" tabindex="2" maxlength="30" size="12" name="CUST_ID" autocomplete="off" value="CUST10101"></td>
				</tr>
				<tr>
					<td>3</td>
					<td><label>INDUSTRY_TYPE_ID ::*</label></td>
					<td><input id="INDUSTRY_TYPE_ID" tabindex="4" maxlength="12" size="12" name="INDUSTRY_TYPE_ID" autocomplete="off" value="Retail"></td>
				</tr>
				<tr>
					<td>4</td>
					<td><label>Channel ::*</label></td>
					<td><input id="CHANNEL_ID" tabindex="4" maxlength="12"
						size="12" name="CHANNEL_ID" autocomplete="off" value="WEB">
					</td>
				</tr>
				<tr>
					<td>5</td>
					<td><label>txnAmount*</label></td>
					<td><input title="TXN_AMOUNT" tabindex="10"
						type="text" name="TXN_AMOUNT"
						value="${course.getPrice()}">
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td><input value="CheckOut" type="submit" id="paytm-submit"	onclick=""></td>
				</tr>
			</tbody>
		</table>
		* - Mandatory Fields
	</form>
	</section>
	            <%@ include file="footer-all.jsp" %>  
	
	<div id="path" style="display: none">${pageContext.request.contextPath}</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="https://cdn.plyr.io/3.5.3/plyr.polyfilled.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/course-details.js"></script>
	<script>
	
	</script>
</body>
</html>