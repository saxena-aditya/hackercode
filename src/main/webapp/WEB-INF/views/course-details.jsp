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
        <meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loading-btn/loading.css">
	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loading-btn/loading-btn.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/course-details.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/float-login-form.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login-register.css">


<link rel="stylesheet" href="https://cdn.plyr.io/3.5.3/plyr.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js" type="text/javascript"></script>
</head>
<body>
<section>
	<nav class="navbar navbar-expand-lg navbar-light">
	  <a class="navbar-brand" href="${pageContext.request.contextPath}/">
	  	<img src="${pageContext.request.contextPath}/resources/ff-ideas/logo.png" id="owl-graph" alt="">
	  </a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarNavDropdown">
	     <div class="main-nav" id="top-nav">
			<ul id="menu-hac">
	      <li class="nav-item">
	        <a class="nav-link" href="/" id="home-al">Home <span class="sr-only">(current)</span></a>
	      </li>
	      
	    
	      <c:choose>
			    <c:when test="${ doLogin == 1}">
			   
				             <li class="nav-item">
						        <a class="nav-link sign-in-btn cd-signup" id="register-main" href="#">Register</a>
						     </li>
						     <li class="nav-item">
						        <a class="nav-link sign-up-btn cd-signin" href="#">Login</a>
						     </li>
			        	
			        
			    </c:when>    
			    <c:otherwise>
			    
			    <li class="nav-item">
			    	<a class="nav-link" href="${ pageContext.request.contextPath }${ url }">View Dashboard</a>
			    </li>
			    <li class="nav-item">
			    	<a class="nav-link" href="${ pageContext.request.contextPath }/logout">logout</a>
			    </li>
			    	<%-- <li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          Options <i class="fas fa-cog"></i>
				        </a>
				        
				        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
				         <a class="dropdown-item" href="${ pageContext.request.contextPath }/profile">View Dashboard</a>
				          <a class="dropdown-item" href="${ pageContext.request.contextPath }/logout">logout</a>
				        </div>
				      </li> --%>
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
							
							<span id="code-msg">Code: <span id="code"><c:out value="${course.getCode()}" /></span></span>
						</p>
						
						<div class="course-type-bar d-flex justify-content-start">
                        	<div class="inf">${ course.getTags() }</div>
	                     </div>
						<div class="ratings">
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
						</div>
						
                        <div class="course-info-bar d-flex flex-wrap justify-content-between">
                        
	                        <div class="info d-flex">
	                            <div class="time inf">
	                                <i class="far fa-clock sm-icon"></i>
	                                <c:out value="${course.getTotalDays()} days"/>
	                    
	                            
	                            </div>
	                            <div class="lectures inf">
	                                <i class="far fa-play-circle sm-icon"></i>
	                             
	                                <c:choose>
								  <c:when test="${course.isTestSeries()}">
									<span id="top-lec-num"></span> test(s)

								  </c:when>
								
								  <c:otherwise>
								     <span id="top-lec-num"></span> lectures
								  </c:otherwise>
								</c:choose>
	                    
	                            
	                            </div>
	                            <div class="level inf">
	                                <i class="fas fa-level-up-alt"></i>
	                                beginner
	  							</div>
	                      </div>
	                      <div class="price-info d-flex">
	                      	<div class="was-price">
	                      		<i class="fas fa-rupee-sign"></i> ${course.getMrp()}
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
					<source src="${ course.getIntro() }"></source>
				</video>
			</div>
			<div id="sticky-anchor"></div>
			<div class="catalogue" id="sticky">
				<div class="card">
					<div class="card-body d-flex flex-wrap">
						<div class="course-img">
							<img src="${ course.getCover() }" alt="" />
						</div>
						<div class="left">
							<div class="buy-now-btn">
							<c:choose>
							    <c:when test="${ doLogin == 1}">
							    <div class="main-nav">
									<ul id="menu-hack" >
							          
							            <li data-menuanchor="secondPage">
							                <a class="cd-signin buy-now href="#" id="open-tabs">Buy Now</a>
							            </li>
						        	</ul>
								</div>
							    </c:when>    
							    <c:otherwise>
							    	<a href="#" class="buy-now" id="order">Buy Now</a>
							    </c:otherwise>
							</c:choose>
							
							</div>
							<div class="course-dd">
								<div class="heading-small">This Course Includes</div>
								<ul>
								<c:choose>
								  <c:when test="${course.isTestSeries()}">
									<li><i class="fas fa-play-circle"></i> <span id="lec-num"></span>Test(s)</li>
								  </c:when>
								
								  <c:otherwise>
								    <li><i class="fas fa-vial"></i> Practice Test Series</li>
									<li><i class="fas fa-play-circle"></i> <span id="lec-num">${ course.getLessonCount() }</span> Lecture(s)</li>
									<li><i class="fas fa-clock"></i> <span id="lec-hrs"></span> Mins worth study material</li>
								  </c:otherwise>
								</c:choose>
									
									
									<li><i class="fas fa-calendar-day"></i> ${ course.getTotalDays() } Days for access</li>
									<li><i class="fas fa-certificate"></i> Certificate on successful completion</li>
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
                  <a href="${ pageContext.request.contextPath }/signup?course=${course.getCode()}" class="text-black text-small">Register Here</a>
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
<div class="modal" id="login-modal-normal">
  <div class="modal-dialog">
    <div class="modal-content">

     <div class="container-scroller">
    <div class="page-body-wrapper full-page-wrapper auth-page">
      <div class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">
        <div style="width: 100%;">
          <div class="mx-auto">
            <div class="auto-form-wrapper">
              <form action="${pageContext.request.contextPath}/login" method="POST">
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
                  <a href="${ pageContext.request.contextPath }/signup" class="text-black text-small">Register Here</a>
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
	<form method="post" action="/courses/${course.getCode()}/payment/redirect">
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
	 	<div class="cd-user-modal"> <!-- this is the entire modal form, including the background -->
		<div class="cd-user-modal-container"> <!-- this is the container wrapper -->
			<ul class="cd-switcher">
				<li><a href="#">Sign in</a></li>
				<li><a href="#">Register Here</a></li>
			</ul>

			<div id="cd-login"> <!-- log in form -->
			<span id="login-uri" style="display: none;">${pageContext.request.contextPath}/login?course=${course.getCode()}</span>
			<span id="login-uri-normal" style="display: none;">${pageContext.request.contextPath}/login</span>
						<div class="error-msg" style="display: none;text-align: center;padding: 20px 0 0 0;color: #E91E63;font-size: 1.2em;">Opps! Username or Password do not match. Please Try again..!</div>
			
				<form class="cd-form" id="login-frm" method="POST">
					<p class="fieldset">
						<label class="image-replace cd-email" for="signin-email">E-mail</label>
						<input class="full-width has-padding has-border" id="signin-email" name="username" type="email" placeholder="E-mail">
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signin-password">Password</label>
						<input class="full-width has-padding has-border" name="password" id="signin-password" type="text"  placeholder="Password">
						<a href="#" class="hide-password">Hide</a>
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<input type="checkbox" id="remember-me" checked>
						<label for="remember-me">Remember me</label>
					</p>

					<p class="fieldset">
						<input class="full-width sub-inp" type="submit" value="Login">
					</p>
				</form>
				
				<p class="cd-form-bottom-message"><a href="#">Forgot your password?</a></p>
				<!-- <a href="#" class="cd-close-form">Close</a> -->
			</div> <!-- cd-login -->

			<div id="cd-signup"> <!-- sign up form -->
			<span id="signup-uri" style="display: none;">${pageContext.request.contextPath}/signup?course=${course.getCode()}</span>
			<span id="signup-uri-normal" style="display: none;">${pageContext.request.contextPath}/signup</span>
			
				<form class="cd-form" id="signup-frm" method="post">
				<div class="row">
				<p id="r-error-msg" style="display: none;text-align: center;width: 100%;padding: 0 0 20px 0;color: #F44336;">Oops! Seems like this E-Mail is already taken. Please Try Again.</p>
					<div class="col-md-6">
						<p class="fieldset">
							<label class="image-replace cd-username" for="signup-username">First Name</label>
							<input class="full-width has-padding has-border" name="fName" id="flName" type="text" placeholder="First Name">
							<span class="cd-error-message">Please use a valid value</span>
						</p>
					</div>
					<div class="col-md-6">
						<p class="fieldset">
							<label class="image-replace cd-username" for="signup-username">Last Name</label>
							<input class="full-width has-padding has-border" name="lName" id="llName" type="text" placeholder="Last Name">
							<span class="cd-error-message">Please use a valid value</span>
						</p>
					</div>
				</div>
					<p class="fieldset">
						<label class="image-replace cd-email" for="signup-username">E-mail</label>
						<input class="full-width has-padding has-border" name="email" id="emaill" type="text" placeholder="E-mail">
						<span class="cd-error-message">Please use a valid value</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-email" for="signup-email">Phone Number</label>
						<input class="full-width has-padding has-border" name="phoneNum" id="phonel" type="text" placeholder="Phone Number">
						<span class="cd-error-message">Please use a valid value</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signup-password">Password</label>
						<input class="full-width has-padding has-border" name="password" id="passwordl" type="text"  placeholder="Password">
						<a href="#" class="hide-password">Hide</a>
						<span class="cd-error-message">Please use a valid value</span>
					</p>

					<p class="fieldset">
						<input type="checkbox" id="accept-terms">
						<label for="accept-terms">I agree to the <a href="#">Terms</a></label>
					</p>
					<p id="policy-c">
						<span style="padding: 0 0 5px 0;"><strong>Note: </strong><span>Please accept the terms and conditions before proceeding</span></span>
					</p>
					<p class="fieldset">
						
						<input class="full-width has-padding acc-init" type="submit" value="Create account" disabled>
					</p>
				</form>

				<!-- <a href="#" class="cd-close-form">Close</a> -->
			</div> <!-- cd-signup -->


			<div id="cd-reset-password"> <!-- reset password form -->
				<p class="cd-form-message">Lost your password? Please enter your email address. You will receive a link to create a new password.</p>

				<form class="cd-form">
					<p class="fieldset">
						<label class="image-replace cd-email" for="reset-email">E-mail</label>
						<input class="full-width has-padding has-border" id="reset-email" type="email" placeholder="E-mail">
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<input class="full-width has-padding" type="submit" value="Reset password">
					</p>
				</form>

				<p class="cd-form-bottom-message"><a href="#">Back to log-in</a></p>
			</div> <!-- cd-reset-password -->
			<a href="#" class="cd-close-form">Close</a>
		</div> <!-- cd-user-modal-container -->
	</div> <!-- cd-user-modal -->
	
	
	 <div class="modal fade bd-example-modal-lg" id="free-video-modal" tabindex="-1" role="dialog" aria-labelledby="free-video-modal-label" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
     
       <video class="free-vid">
			<source src="${ course.getIntro() }"></source>
		</video>
      </div>
    </div>
  </div>
</div>
	
	<div id="path" style="display: none">${pageContext.request.contextPath}</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="https://cdn.plyr.io/3.5.3/plyr.polyfilled.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/course-details.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
	
	<script>
	jQuery(document).ready(function($){
    	var $form_modal = $('.cd-user-modal'),
    		$form_login = $form_modal.find('#cd-login'),
    		$form_signup = $form_modal.find('#cd-signup'),
    		$form_forgot_password = $form_modal.find('#cd-reset-password'),
    		$form_modal_tab = $('.cd-switcher'),
    		$tab_login = $form_modal_tab.children('li').eq(0).children('a'),
    		$tab_signup = $form_modal_tab.children('li').eq(1).children('a'),
    		$forgot_password_link = $form_login.find('.cd-form-bottom-message a'),
    		$back_to_login_link = $form_forgot_password.find('.cd-form-bottom-message a'),
    		$main_nav = $('.main-nav');

    	//open modal
    	$main_nav.on('click', function(event){
    		var xx = $(this).find('#open-tabs');
			if (xx.length == 0) {
				$("#login-frm").attr("action", $("#login-uri-normal").html());
				$("#signup-frm").attr("action", $("#signup-uri-normal").html());
				
			}
			else {
				$("#login-frm").attr("action", $("#login-uri").html());
				$("#signup-frm").attr("action", $("#signup-uri").html());
				
			}
    		if( $(event.target).is($main_nav) ) {
    			// on mobile open the submenu
    			$(this).children('ul').toggleClass('is-visible');
    			
    		} else {
    			// on mobile close submenu
    			$main_nav.children('ul').removeClass('is-visible');
    			//show modal layer
    			$form_modal.addClass('is-visible');	
    			//show the selected form
    			( $(event.target).is('.cd-signup') ) ? signup_selected() : login_selected();
    		}

    	});

    	//close modal
    	$('.cd-user-modal').on('click', function(event){
    		if( $(event.target).is($form_modal) || $(event.target).is('.cd-close-form') ) {
    			$form_modal.removeClass('is-visible');
    		}	
    	});
    	//close modal when clicking the esc keyboard button
    	$(document).keyup(function(event){
        	if(event.which=='27'){
        		$form_modal.removeClass('is-visible');
    	    }
        });

    	//switch from a tab to another
    	$form_modal_tab.on('click', function(event) {
    		event.preventDefault();
    		( $(event.target).is( $tab_login ) ) ? login_selected() : signup_selected();
    	});

    	//hide or show password
    	$('.hide-password').on('click', function(){
    		var $this= $(this),
    			$password_field = $this.prev('input');
    		
    		( 'password' == $password_field.attr('type') ) ? $password_field.attr('type', 'text') : $password_field.attr('type', 'password');
    		( 'Hide' == $this.text() ) ? $this.text('Show') : $this.text('Hide');
    		//focus and move cursor to the end of input field
    		$password_field.putCursorAtEnd();
    	});

    	//show forgot-password form 
    	$forgot_password_link.on('click', function(event){
    		event.preventDefault();
    		forgot_password_selected();
    	});

    	//back to login from the forgot-password form
    	$back_to_login_link.on('click', function(event){
    		event.preventDefault();
    		login_selected();
    	});

    	function login_selected(){
    		$form_login.addClass('is-selected');
    		$form_signup.removeClass('is-selected');
    		$form_forgot_password.removeClass('is-selected');
    		$tab_login.addClass('selected');
    		$tab_signup.removeClass('selected');
    	}

    	function signup_selected(){
    		$form_login.removeClass('is-selected');
    		$form_signup.addClass('is-selected');
    		$form_forgot_password.removeClass('is-selected');
    		$tab_login.removeClass('selected');
    		$tab_signup.addClass('selected');
    	}

    	function forgot_password_selected(){
    		$form_login.removeClass('is-selected');
    		$form_signup.removeClass('is-selected');
    		$form_forgot_password.addClass('is-selected');
    	}

    	/* //REMOVE THIS - it's just to show error messages 
    	$form_login.find('input[type="submit"]').on('click', function(event){
    		event.preventDefault();
    		$form_login.find('input[type="email"]').toggleClass('has-error').next('span').toggleClass('is-visible');
    	});
    	$form_signup.find('input[type="submit"]').on('click', function(event){
    		event.preventDefault();
    		$form_signup.find('input[type="email"]').toggleClass('has-error').next('span').toggleClass('is-visible');
    	}); */
    	$form_login.find('input[type="submit"]').on('click', function(event){
    		event.preventDefault();
    		$.ajax({
    			method: "POST",
    			url: $("#login-frm").attr("action"),
    			data: {
    				username: $("#signin-email").val(), 
    				password: $("#signin-password").val()
    			},
    			beforeSend: function() {
    				console.log("sending login");
    				$(".sub-inp").val("Checking...");
    			},
    			success: function(data) {
    				if (data) {
    					let login = JSON.parse(data);
						if (login.isUser) {
							window.location.href = "/" + login.view;
            				$(".sub-inp").val("Logging In...");

						}
						else {
							$(".error-msg").show();
            				$(".sub-inp").val("Login");

						}
    				}
    			},
    			error: function(a, xhr, b) {
    				console.log(a, xhr, b);
    			}
    			
    		})
    		//$form_login.find('input[type="email"]').toggleClass('has-error').next('span').toggleClass('is-visible');
    	});
    	
    	function validateEmail(email) {
    		if (email.length === 0) return false;
    		  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    		  return re.test(email);
    	}
    	$("#accept-terms").on("click", function(e) {
    		if($(this).prop("checked") == true){
    			$form_signup.find('input[type="submit"]').removeAttr("disabled");
    			$("#policy-c").hide();
    		}
            else if($(this).prop("checked") == false){
    			$("#policy-c").show();
    			$form_signup.find('input[type="submit"]').attr("disabled", "disabled");
            }
    	}) 
    	$form_signup.find('input[type="submit"]').on('click', function(event){
    		event.preventDefault();
    		let r = {
    				flName: $("#flName").val(),
    				llName: $("#llName").val(),
    				phonel: $("#phonel").val(),
    				emaill: $("#emaill").val(),
    				passwordl: $("#passwordl").val()
    		};
    		console.log("regester", r );
    		let error = false;
    		Object.keys(r).forEach(e => {
    			console.log("key", r[e].length);
    			if (r[e].length === 0) {
    				$form_signup.find('#' + e).addClass('has-error').next('span').addClass('is-visible');
    				error = true;
    			}else {
    				$form_signup.find('#' + e).removeClass('has-error').next('span').removeClass('is-visible');
    			}
    			
    			if (e === "emaill") {
    				if (!validateEmail(r[e])) {
        				$form_signup.find('#' + e).addClass('has-error').next('span').addClass('is-visible');
        				error = true;

    				}
    				else {
        				$form_signup.find('#' + e).removeClass('has-error').next('span').removeClass('is-visible');
    				}
    			}
    			
    			if (e === "phonel") {
    				if (r[e].length !== 10) {
        				$form_signup.find('#' + e).addClass('has-error').next('span').addClass('is-visible');
        				error = true;

    				}
    				else {
        				$form_signup.find('#' + e).removeClass('has-error').next('span').removeClass('is-visible');
    				}
    			}
    		});
    		
    		if (!error) {
    			// save data
    			$.ajax({
    				method: "POST",
    				url: $("#signup-frm").attr("action"),
    				data: {
    					fName: r.flName,
    					lName: r.llName,
    					email: r.emaill,
    					password: r.passwordl,
    					phone: r.phonel,
    				},
    				beforeSend:function() {
    					$(".acc-init").val("Registering...");
    				},
    				success: function(data) {
    					if (data) {
    						let reg = JSON.parse(data);
    						console.log(reg);
    						if (reg.error) {
    							$("#r-error-msg").show();
            					$(".acc-init").val("Create Account");

    						}
    						else {
    							window.location.href = reg.view;
            					$(".acc-init").val("Logging In...")

    						}
    					}
    				},
    				error: function(a, xhr, b) {
    					console.log(a, xhr, b);
    				}
    				
    			})
    		}

    		
    		return false;
    	}); 

    	//IE9 placeholder fallback
    	//credits http://www.hagenburger.net/BLOG/HTML5-Input-Placeholder-Fix-With-jQuery.html
    	if(!Modernizr.input.placeholder){
    		$('[placeholder]').focus(function() {
    			var input = $(this);
    			if (input.val() == input.attr('placeholder')) {
    				input.val('');
    		  	}
    		}).blur(function() {
    		 	var input = $(this);
    		  	if (input.val() == '' || input.val() == input.attr('placeholder')) {
    				input.val(input.attr('placeholder'));
    		  	}
    		}).blur();
    		$('[placeholder]').parents('form').submit(function() {
    		  	$(this).find('[placeholder]').each(function() {
    				var input = $(this);
    				if (input.val() == input.attr('placeholder')) {
    			 		input.val('');
    				}
    		  	})
    		});
    	}

    });


    //credits https://css-tricks.com/snippets/jquery/move-cursor-to-end-of-textarea-or-input/
    jQuery.fn.putCursorAtEnd = function() {
    	return this.each(function() {
        	// If this function exists...
        	if (this.setSelectionRange) {
          		// ... then use it (Doesn't work in IE)
          		// Double the length because Opera is inconsistent about whether a carriage return is one character or two. Sigh.
          		var len = $(this).val().length * 2;
          		this.setSelectionRange(len, len);
        	} else {
        		// ... otherwise replace the contents with itself
        		// (Doesn't work in Google Chrome)
          		$(this).val($(this).val());
        	}
    	});
    };
    $("#register-me").on('click', function() {
    	$("#register-main").click();
   		
    	return false;
    });
	</script>
</body>
</html>