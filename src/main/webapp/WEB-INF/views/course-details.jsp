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
	  <a class="navbar-brand" href="${pageContext.request.contextPath}">
	  	<img src="${pageContext.request.contextPath}/resources/ff-ideas/logo.png" id="owl-graph" alt="">
	  </a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarNavDropdown">
	     <div class="main-nav" id="top-nav">
			<ul id="menu-hac">
	      <li class="nav-item">
	        <a class="nav-link" href="${ pageContext.request.contextPath }" id="home-al">Home <span class="sr-only">(current)</span></a>
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
			    	<a class="nav-link" href="${ pageContext.request.contextPath }/profile">View Dashboard</a>
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
	                                <span id="top-lec-num"></span> lectures
	                    
	                            
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
					<source src="https://do4k6lnx3y4m9.cloudfront.net/HackWithInfy_Intro2.mp4"></source>
				</video>
			</div>
			<div id="sticky-anchor"></div>
			<div class="catalogue" id="sticky">
				<div class="card">
					<div class="card-body d-flex flex-wrap">
						<div class="course-img">
							<img src="data:image/png;base64,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" alt="" />
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
									<li><i class="fas fa-play-circle"></i> <span id="lec-num">33</span> Lectures</li>
									<li><i class="fas fa-clock"></i> <span id="lec-hrs"></span> Mins worth study material</li>
									<li><i class="fas fa-calendar-day"></i> ${ course.getTotalDays() } Days for access</li>
									<li><i class="fas fa-vial"></i> Practice Test Series</li>
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
						<input class="full-width" type="submit" value="Login">
					</p>
				</form>
				
				<p class="cd-form-bottom-message"><a href="#">Forgot your password?</a></p>
				<!-- <a href="#" class="cd-close-form">Close</a> -->
			</div> <!-- cd-login -->

			<div id="cd-signup"> <!-- sign up form -->
			<span style="display:none" id="signup-uri">${pageContext.request.contextPath}/signup?course=${course.getCode()}</span>
			<span style="display:none" id="signup-uri-normal">${pageContext.request.contextPath}/signup</span>
			
				<form class="cd-form" id="signup-frm" method="post">
				<div class="row">
					<div class="col-md-6">
						<p class="fieldset">
							<label class="image-replace cd-username" for="signup-username">First Name</label>
							<input class="full-width has-padding has-border" name="fName" id="signup-username" type="text" placeholder="First Name">
							<span class="cd-error-message">Error message here!</span>
						</p>
					</div>
					<div class="col-md-6">
						<p class="fieldset">
							<label class="image-replace cd-username" for="signup-username">Last Name</label>
							<input class="full-width has-padding has-border" name="lName" id="signup-username" type="text" placeholder="Last Name">
							<span class="cd-error-message">Error message here!</span>
						</p>
					</div>
				</div>
					<p class="fieldset">
						<label class="image-replace cd-email" for="signup-username">E-mail</label>
						<input class="full-width has-padding has-border" name="email" id="signup-username" type="text" placeholder="E-mail">
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-email" for="signup-email">Phone Number</label>
						<input class="full-width has-padding has-border" name="phoneNum" id="signup-email" type="number" placeholder="Phone Number">
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signup-password">Password</label>
						<input class="full-width has-padding has-border" name="password" id="signup-password" type="text"  placeholder="Password">
						<a href="#" class="hide-password">Hide</a>
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<input type="checkbox" id="accept-terms">
						<label for="accept-terms">I agree to the <a href="#">Terms</a></label>
					</p>

					<p class="fieldset">
						<input class="full-width has-padding" type="submit" value="Create account">
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