<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<!doctype html>
<html class="no-js" lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Hackercode.in</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">
        <link href="https://fonts.googleapis.com/css?family=Rubik:400,500,700" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.2.1/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.7/jquery.fullpage.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/test-admin-panel/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
	    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/test-admin-panel/images/favicon.png" />
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/tooltipster/dist/css/tooltipster.bundle.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login-register.css">
    </head>
    <body>
    <input type="hidden" value='${nav}' id="nav">
    <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    	<div class="modal-header">
	    		<h1>Apply For Internship</h1>
	    		<button type="button" class="close" data-dismiss="modal">&times;</button>
	    		
	    	</div>
	    	<div class="modal-body">
	    		<div class="info-internship">
	    			<ol class="f">
	    				<li>Apply for an internship and get the credentials at your mailBox.</li>
	    				<li>Choose a topic which is not published at HackerCode.</li>
	    				<li>Submit an article by login to drafter account by using our login button at Home Page.</li>
	    				<li>Drop a mail at hackercode.19@gmail.com with your resume, after 3 of your articles get published with Subject "Technical Writer Intern".</li>
	    				<li>Get a stipend and an internship certificate.</li>
	    			</ol>
	    		</div>
	    		<hr />
	    		<div class="saved-msg" style="display:none;">
	    			<i class="fas fa-clipboard-check"></i>
	    			<h1>Thank You for showing your interest</h1>
	    			<h6>We will contact you soon</h6>
	    		</div>
	    		<div class="internship-form">
	    			<div class="row">
	    				<div class="col-md-6">
	    					<div class="form-group">
	    						<label for="">First Name:</label>
	    						<input type="text" class="form-control" id="f-name" placeholder="First Name" />
	    					</div>
	    				</div>
	    				<div class="col-md-6">
	    					<div class="form-group">
	    						<label for="">Last Name:</label>
	    						<input type="text" class="form-control" id="l-name" placeholder="Last Name" />
	    					</div>
	    				</div>
	    			</div>
	    			<div class="row">
	    				<div class="col-md-6">
	    					<div class="form-group">
	    						<label for="">Contact Number:</label>
	    						<input type="number" class="form-control" id="ph-num" placeholder="Contact Number"/>
	    					</div>
	    				</div>
	    				<div class="col-md-6">
	    					<div class="form-group">
	    						<label for="">E-Mail:</label>
	    						<input type="email" class="form-control" id="email" placeholder="Email Id" />
	    						
	    					</div>
	    				</div>
	    			</div>
	    			<div class="row">
	    				<div class="col-md-6">
	    					<div class="form-group">
	    						<label for="">University:</label>
	    						<input type="text" class="form-control" id="university" placeholder="University Name"/>
	    					</div>
	    				</div>
	    				<div class="col-md-6">
	    					<div class="form-group">
	    						<label for="">Course:</label>
	    						<input type="text" class="form-control" id="course" placeholder="Course" />
	    						
	    					</div>
	    				</div>
	    			</div>
	    			<div class="row">
	    				<div class="col-md-6">
	    					<div class="form-group">
	    						<label for="">Semester</label>
	    						<input type="number" class="form-control" id="semester" placeholder="Semester"/>
	    					</div>
	    				</div>
	    				<div class="col-md-6">
	    					<div class="form-group">
	    						<label for="">City:</label>
	    						<input type="text" class="form-control" id="city" placeholder="City" />
	    						
	    					</div>
	    				</div>
	    			</div>
	    			<div class="row">
	    				<div class="col-md-12">
	    					<button class="btn btn-success" id="s-app" style="width: 100%;">Submit Application</button>
	    				</div>
	    			</div>
	    		</div>
	    	</div>
	    
	    </div>
	  </div>
</div>
    <div class="se-pre-con"></div>
            <nav class="main-nav">
				<ul id="menu-hack">
					<li>
						<a id="itn-btn" class="cd-signin" href="" data-toggle="modal" data-target=".bd-example-modal-lg">Appy for Internship</a>
					</li>
					<li>
						<a id="resc-btn" class="cd-signin" href="${ pageContext.request.contextPath }/resources">Exercises</a>
					</li>
    
	    			<c:choose>
				    	<c:when test="${ doLogin == 1}">
				         
							
				            <li data-menuanchor="firstPage">
				                <a id="r-btn" class="cd-signup" href="#firstPage" id="register-main">Register</a>
				            </li>
				            <li data-menuanchor="secondPage">
				                <a id="l-btn" class="cd-signin" href="#" data-toggle="modal" data-target="#login-modal">Login</a>
				            </li>
				    	</c:when>    
				    <c:otherwise>
			    
			    		<li>
			    			<a class="cd-signin" href="${ pageContext.request.contextPath }/${ url }">Return to Dashboard</a>
			    		</li>
			    	
			    </c:otherwise>
			</c:choose>
			</ul>
			</nav>
			    	
        
        <!-- The Modal -->
<%-- <div class="modal" id="login-modal">
  <div class="modal-dialog">
    <div class="modal-content">

     <div class="container-scroller">
    <div class="page-body-wrapper full-page-wrapper auth-page">
      <div class="content-wrapper d-flex flex-wrap align-items-center auth auth-bg-1 theme-one">
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
                        <i class="mdi mdi-account"></i>
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
                        <i class="mdi mdi-security"></i>
                      </span>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <button class="btn btn-primary submit-btn btn-block">Login</button>
                </div>
                <div class="form-group d-flex flex-wrap justify-content-between">
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
                  <a href="register.html" class="text-black text-small">Create new account</a>
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
</div> --%>
	<div class="cd-user-modal"> <!-- this is the entire modal form, including the background -->
		<div class="cd-user-modal-container"> <!-- this is the container wrapper -->
			<ul class="cd-switcher">
				<li><a href="#">Sign in</a></li>
				<li><a href="#">Register Here</a></li>
			</ul>

			<div id="cd-login"> <!-- log in form -->
			<div class="error-msg" style="display: none;text-align: center;padding: 20px 0 0 0;color: #E91E63;font-size: 1.2em;">Opps! Username or Password do not match. Please Try again..!</div>
				<form class="cd-form" action="${pageContext.request.contextPath}/login" method="POST">
					<p class="fieldset">
						<label class="image-replace cd-email" for="signin-email">E-mail</label>
						<input class="full-width has-padding has-border" id="signin-email" name="username" type="email" placeholder="E-mail">
						<span class="cd-error-message">Error message here!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signin-password">Password</label>
						<input class="full-width has-padding has-border" name="password" id="signin-password" type="password"  placeholder="Password here">
						<a href="#" class="hide-password">Show</a>
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
				<form class="cd-form" action="${pageContext.request.contextPath}/signup" method="post">
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
				<p id="reset-error" style="text-align: center;color: #F44336;padding-top: 20px;display: none;">No user with this email found. Please register.</p>
				<form class="cd-form">
					<p class="fieldset">
						<label class="image-replace cd-email" for="reset-email">E-mail</label>
						<input class="full-width has-padding has-border" id="reset-email" type="email" placeholder="E-mail">
						<span class="cd-error-message">Please Enter a Valid E-Mail</span>
					</p>

					<p class="fieldset">
						<input class="full-width has-padding" id="password-reset-btn" type="submit" value="Reset password">
					</p>
				</form>

				<p class="cd-form-bottom-message"><a href="#">Back to log-in</a></p>
			</div> <!-- cd-reset-password -->
			<a href="#" class="cd-close-form">Close</a>
		</div> <!-- cd-user-modal-container -->
	</div> <!-- cd-user-modal -->

        <div id="fullpage">
            <div class="section" data-anchor="sec-front">
                <img src="${pageContext.request.contextPath}/resources/ff-ideas/logo.png" id="owl-graph" alt="">
                <img src="${pageContext.request.contextPath}/resources/ff-ideas/bulb-front.png" alt="" id="bulb-front">
                <div class="sec-nav container">
                	<nav class="navbar navbar-expand-lg navbar-light">
					  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
					    <span class="navbar-toggler-icon"></span>
					  </button>
					  <div class="collapse navbar-collapse" id="navbarNavDropdown">
					    <ul class="navbar-nav ml-auto" id="categories">
					     
					     
					      <!-- <li class="nav-item dropdown active">
					        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					          Dropdown link
					        </a>
					        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
					          <a class="dropdown-item" href="#">Action</a>
					          <a class="dropdown-item" href="#">Another action</a>
					          <a class="dropdown-item" href="#">Something else here</a>
					        </div>
					      </li> -->
					    </ul>
					  </div>
					</nav>
                </div>
                <div class="head-area">
                    <h4>welcome to,
                </h4>
                    <h1>
                        <i class="fas fa-angle-left"></i>
                        HackerCode
                        <i class="fas fa-angle-right"></i>
                        
                    </h1>
                    <h3>Tomorrow starts here with Hacker Code. A platform for computer enthusiasts who imagine the impossible and make a difference. Be uniquely you and dive in the world of coding and learn what you require, push your limits, while(!(success == try()), test yourself. Code with ease and experience a greater measure of confidence with Hacker Code. 
                    <br><br>First do it, then do it right, then do it better.
                
                    </h3>
                    <div class="choice-area">
                        <span id="choice-qst">Would you like to 
                        </span>
                        <span>
                            <a href="#" class="choice-ans" id="next">Browse Courses</a>
                        </span>
                        <span id="slash">/</span>
                        <span>      
                            <a href="#" class="choice-ans" id="take-test">Take Test</a>

                        </span>
                    </div>
                </div>
            </div>
            <div class="section" data-anchor="sec-courses-info">
                <div class="wrapper d-flex flex-wrap flex-wrap">
                    <div class="left-section-header">
                        <h5>Learn With HackerCode in a simple way</h5>
                    </div>
                    <div class="list-courses">
                        <div class="nab-bar-courses">
                            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">Online</a>
                                </li>
                               <!--  <li class="nav-item hc-disabled">
                                    <a class="nav-link" id="pills-profile-tab"  href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">Classroom</a>
                                </li>
                                <li class="nav-item hc-disabled">
                                    <a class="nav-link" id="pills-contact-tab"  href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false">Free</a>
                                </li> -->
                            </ul>
                            <div class="tab-content" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                                    <div class="container">
                                        <div class="row slick" style="margin: 0;">
                                        <c:forEach items="${courses}" var="c">
										    <div class="col-md-xxc">
                                                <div class="card">
                                                    <img src="${ c.getCover() }">
                                                    <div class="card-body">
                                                        <div class="card-title"><c:out value="${c.getName()} "/>
                                                </div>
                                                        <div class="card-text">
                                                            <div class="course-type-bar d-flex flex-wrap justify-content-start">
                                                                <div class="inf"><c:out value="${c.getTags()}"/>
                                                        </div>
                                                            </div>
                                                            <div class="course-info-bar d-flex flex-wrap justify-content-between">
                                                                <div class="time inf">
                                                                    <i class="far fa-clock sm-icon"></i>
                                                                    <c:out value="${c.getDays()} days"/>

                                                                </div>
                                                                <div class="lectures inf">
                                                                    <i class="far fa-play-circle sm-icon"></i>
                                                                    23 lectures

                                                                </div>
                                                                <div class="level inf">
                                                                    <i class="fas fa-level-up-alt"></i>
                                                                    beginer

                                                                </div>
                                                            </div>
                                                            <div class="course-ratings d-flex flex-wrap justify-content-between">
                                                                <div class="stars">
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                    <i class="fas fa-star"></i>
                                                                </div>
                                                                <div class="add-to-wishlist">
                                                                    <i class="far fa-heart"></i>
                                                                </div>
                                                            </div>
                                                            <div class="price-details d-flex flex-wrap justify-content-between">
                                                                <div class="price">
                                                                    <span class="was-price">
                                                                        <i class="fas fa-rupee-sign sm-icon"></i>
                                                            				${c.getMrp() }
                                                                    
                                                                    </span>
                                                                    <span class="is-price">
                                                                        <i class="fas fa-rupee-sign"></i>
                                                                        <c:out value="${c.getPrice()}"/>
                                                            
                                                                    
                                                                    </span>
                                                                </div>
                                                                <div class="details">
                                                                    <span class="tooltipp" data-tooltip-content="#tooltip_content-${c.getCode()}">
                                                                        <i class="fas fa-info-circle"></i>
                                                                    </span>
                                                                    <c:set var = "verbose" value = "${c.getName()}"/>
      																<c:set var = "urlF" value = "${fn:toLowerCase(fn:replace(verbose, ' ', '-'))}" />
                                                                    <a class="enroll-btn sm-btn" href="${ pageContext.request.contextPath }/courses/${ c.getCode()}/${ urlF }">Details</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
										</c:forEach>
                                            
                                            
                                           <!-- asd -->
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur provident delectus perferendis ab, vel minima ipsa. Illo reiciendis consequatur, voluptatem, debitis quos commodi repudiandae recusandae eum tempora possimus! Voluptatem, autem.</div>
                                <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Culpa eligendi accusantium, delectus consequuntur iste distinctio qui quaerat labore, libero quis itaque, ullam, aliquam. Fugit consectetur atque, delectus ullam suscipit enim!</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="horizontal-testinomial-list">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="testinomial d-flex flex-wrap">
                                    <div class="img">
                                        <img src="${pageContext.request.contextPath}/resources/ff-ideas/person-1.png" >
                                    </div>
                                    <div class="info">
                                        <div class="name">Aditya Saxena</div>
                                        <div class="comment">I've prepared for my placements here and got placed at Samsung R&D. Personalized Interview Module helped me a lot for my Interview preparations.</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="testinomial d-flex flex-wrap">
                                    <div class="img">
                                        <img src="${pageContext.request.contextPath}/resources/ff-ideas/person-2.png" >
                                    </div>
                                    <div class="info">
                                        <div class="name">Vaibhav Gupta</div>
                                        <div class="comment">HackerCode has been one of the reasons for my good command in coding. Problems and discussion panel has greatly helped me in getting my dream placement. Thank you HackerCode. :-)</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="testinomial d-flex flex-wrap">
                                    <div class="img">
                                        <img src="${pageContext.request.contextPath}/resources/ff-ideas/person-3.png" >
                                    </div>
                                    <div class="info">
                                        <div class="name">Harsh Gupta</div>
                                        <div class="comment">HackWithInfy course at HackerCode helped me to get selected in Infosys at System Specialist Profile. Course is fully organized for placement preparation.</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tooltip_templates_custom" style="display: none">
                
                <c:forEach items="${courses}" var="c">
	                    <div id="tooltip_content-${ c.getCode() }" class="tooltip-content">
	                        <div class="card">
	                            <div class="card-header">
	                                <h5>${ c.getName() }</h5>
	                            </div>
	                            <div class="card-body">
	                                <div class="card-text">
	                                    <div class="course-type-bar d-flex flex-wrap justify-content-start">
	                                        <div class="inf">${ c.getTags() }
	                                </div>
	                                    </div>
	                                    <div class="course-info-bar d-flex flex-wrap justify-content-between">
	                                        <div class="time inf">
	                                            <i class="far fa-clock sm-icon"></i>
	                                            ${ c.getDays() } days 
	                                
	                                        
	                                        </div>
	                                        <div class="lectures inf">
	                                            <i class="far fa-play-circle sm-icon"></i>
	                                            23 lectures
	                                
	                                        
	                                        </div>
	                                        <div class="level inf">
	                                            <i class="fas fa-level-up-alt"></i>
	                                            beginer
	                                
	                                        
	                                        </div>
	                                    </div>
	                                    <div class="course-info">
	                                        <div class="course-desc">
	                                        	${ c.getSubDesc() }
	                                        </div>
	                                       
	                                    </div>
	                                    <div class="price-details d-flex flex-wrap justify-content-between">
	                                        <div class="price">
	                                            <span class="was-price">
	                                                <i class="fas fa-rupee-sign sm-icon"></i>
	                                                ${ c.getMrp() }
	                                    
	                                            
	                                            </span>
	                                            <span class="is-price">
	                                                <i class="fas fa-rupee-sign"></i>
	                                                ${c.getPrice()}

	                                    
	                                            
	                                            </span>
	                                        </div>
	                                        <div class="details">
	                                            <span id="tooltipp">
	                                                <i class="fas fa-info-circle"></i>
	                                                Details
	                                            
	                                            </span>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
                	
                </c:forEach>
                </div>
                
            </div>
            <div class="section fp-auto-height-responsive" data-anchor="sec-info">
                <div class="lms d-flex flex-wrap">
                    <div class="lms-img">
                        <img id="lms-design" src="${pageContext.request.contextPath}/resources/ff-ideas/160-design.jpg" alt="">
                    </div>
                    <div class="lms-right-col">
                        <div class="lms-details">
                            <h2>
	                            <i class="fas fa-angle-left"></i>
	                            	HackerCode
	                            <i class="fas fa-angle-right"></i>
                            </h2>
                            <div class="lms-desc">A clean platform for the buddies to assimilate and explore by
show casing their talents in a bliss of different technical flavors,
spread over a huge genre of plethoric comprehension. Dive deep
into the spectrum of knowledge, encompassing every trail of
perception, and bring the best out of you through uninterrupted
efforts!</div>
                            <div class="lms-features d-flex flex-wrap">
                                <div class="lms-feature">
                                    <div class="sym">
                                        <i class="fas fa-shield-alt"></i>
                                    </div>
                                    <div class="name">Trust</div>
                                </div>
                                <div class="lms-feature">
                                    <div class="sym">
                                        <i class="far fa-heart"></i>
                                    </div>
                                    <div class="name">Love</div>
                                </div>
                                <div class="lms-feature">
                                    <div class="sym">
                                        <i class="fas fa-sync-alt"></i>
                                    </div>
                                    <div class="name">Sync</div>
                                </div>
                                <div class="lms-feature">
                                    <div class="sym">
                                        <i class="fas fa-chart-pie"></i>
                                    </div>
                                    <div class="name">Stats</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- <div class="section" data-anchor="sec-team">
                <div class="row">
                    <div class="col-md-5">
                        <div class="team"></div>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-5" style="padding-left:0px; padding-right:0px">
                            <div class="team">
                                <div class="header">
                                    <h2>Meet the team</h2>
                                </div>
                                <div class="desc">Young and dynamic members of team having industry as well as academic experience, rich in programming and dedicated towards the learners 24 X 7.</div>
                                <div class="img">
                                    <img src="${pageContext.request.contextPath}/resources/ff-ideas/team-dd.jpg" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="row">
                                <div class="col-md-5 offset-md-1">
                                    <div class="member">
                                        <div class="img">
                                            <img src="${pageContext.request.contextPath}/resources/ff-ideas/p-6.jpg" alt="member">
                                        </div>
                                        <div class="name">Ashish Garg</div>
                                        <div class="designation">Founder</div>
                                        <div class="desc">B.Tech, M.Tech (IIIT, Bangalore) <br> Programming Expert, 5 times GATE qualified, Ex-IBM Software Developer</div>
                                        <div class="links">
                                            <ul>
                                               <li>
	                                               <a href="https://www.facebook.com/ashugeu6791">
	                                               		<i class="fab fa-facebook fb"></i>
	                                               </a>
                                               </li>
                                                <li>
                                                	<a href="https://github.com/ashugeu">
                                                    	<i class="fab fa-github git"></i>
                                                    </a>
                                                </li>
                                                <li>
                                                	<a href="https://www.linkedin.com/in/ashish-garg-0482b8a0/">
                                                    	<i class="fab fa-linkedin ln"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div> 
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <div class="member">
                                        <div class="img">
                                            <img src="${pageContext.request.contextPath}/resources/ff-ideas/p-7.png" alt="member">
                                        </div>
                                        <div class="name">Akshay Rajput</div>
                                        <div class="designation">Co-Founder</div>
                                        <div class="desc">B.Tech, M.Tech (IIT, Delhi)<br> Active Competitive Programmer, AIR-70, 4 times GATE Qualified <br> Ex-WorksApplications Singapore, Software Developer. </div>
                                        <div class="links">
                                            <ul>
                                                 <li>
                                                	<i class="fab fa-facebook fb"></i>
                                                </li>
                                                <li>
                                                	<a href="https://github.com/akshayrajput">
                                                    	<i class="fab fa-github git"></i> 
                                                    </a>
                                                </li>
                                                <li>
	                                                <a href="https://www.linkedin.com/in/akshay-rajput-59709310b/">	
	                                                    <i class="fab fa-linkedin ln"></i>
	                                                </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4"></div>
                    </div>
                </div>
            </div> -->
            <%-- <div class="section" id="success-stories">
                <div class="row" style="height: -webkit-fill-available;">
                    <div class="col-md-5">
                        <div class="success-story-desc">
                            <div class="header">
                                <h2>Success Stories</h2>
                            </div>
                            <div class="desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus facilis nam assumenda voluptas consequatur similique consequuntur, quasi magni nemo soluta voluptates culpa laudantium veritatis provident excepturi quae voluptate aut dolore.

                    </div>
                            <div class="desc-img">
                                <img src="${pageContext.request.contextPath}/resources/ff-ideas/78786.jpg" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7">
                        <div class="grid">
                            <div class="grid-item">
                                <div class="success-story">
                                    <div class="details">
                                        <div class="wrap-center">
                                            <div class="name">Aditya Saxena</div>
                                            <div class="age">21</div>
                                            <div class="content">GATE AIR 1</div>
                                        </div>
                                    </div>
                                    <img src="${pageContext.request.contextPath}/resources/ff-ideas/p-1.png" alt="success-story">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="success-story">
                                    <div class="details">
                                        <div class="wrap-center">
                                            <div class="name">Aditya Saxena</div>
                                            <div class="age">21</div>
                                            <div class="content">GATE AIR 1</div>
                                        </div>
                                    </div>
                                    <img src="${pageContext.request.contextPath}/resources/ff-ideas/p-2.jpg" alt="success-story">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="success-story">
                                    <div class="details">
                                        <div class="wrap-center">
                                            <div class="name">Aditya Saxena</div>
                                            <div class="age">21</div>
                                            <div class="content">GATE AIR 1</div>
                                        </div>
                                    </div>
                                    <img src="${pageContext.request.contextPath}/resources/ff-ideas/p-3.jpg" alt="success-story">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="success-story">
                                    <div class="details">
                                        <div class="wrap-center">
                                            <div class="name">Aditya Saxena</div>
                                            <div class="age">21</div>
                                            <div class="content">GATE AIR 1</div>
                                        </div>
                                    </div>
                                    <img src="${pageContext.request.contextPath}/resources/ff-ideas/p-4.jpg" alt="success-story">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="success-story">
                                    <div class="details">
                                        <div class="wrap-center">
                                            <div class="name">Aditya Saxena</div>
                                            <div class="age">21</div>
                                            <div class="content">GATE AIR 1</div>
                                        </div>
                                    </div>
                                    <img src="${pageContext.request.contextPath}/resources/ff-ideas/p-5.jpeg" alt="success-story">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="success-story">
                                    <div class="details">
                                        <div class="wrap-center">
                                            <div class="name">Aditya Saxena</div>
                                            <div class="age">21</div>
                                            <div class="content">GATE AIR 1</div>
                                        </div>
                                    </div>
                                    <img src="${pageContext.request.contextPath}/resources/ff-ideas/p-6.jpg" alt="success-story">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="success-story">
                                    <div class="details">
                                        <div class="wrap-center">
                                            <div class="name">Aditya Saxena</div>
                                            <div class="age">21</div>
                                            <div class="content">GATE AIR 1</div>
                                        </div>
                                    </div>
                                    <img src="https://via.placeholder.com/130" alt="success-story">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="success-story">
                                    <div class="details">
                                        <div class="wrap-center">
                                            <div class="name">Aditya Saxena</div>
                                            <div class="age">21</div>
                                            <div class="content">GATE AIR 1</div>
                                        </div>
                                    </div>
                                    <img src="https://via.placeholder.com/220" alt="success-story">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="success-story">
                                    <div class="details">
                                        <div class="wrap-center">
                                            <div class="name">Aditya Saxena</div>
                                            <div class="age">21</div>
                                            <div class="content">GATE AIR 1</div>
                                        </div>
                                    </div>
                                    <img src="https://via.placeholder.com/120" alt="success-story">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="success-story">
                                    <div class="details">
                                        <div class="wrap-center">
                                            <div class="name">Aditya Saxena</div>
                                            <div class="age">21</div>
                                            <div class="content">GATE AIR 1</div>
                                        </div>
                                    </div>
                                    <img src="https://via.placeholder.com/190" alt="success-story">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="success-story">
                                    <div class="details">
                                        <div class="wrap-center">
                                            <div class="name">Aditya Saxena</div>
                                            <div class="age">21</div>
                                            <div class="content">GATE AIR 1</div>
                                        </div>
                                    </div>
                                    <img src="${pageContext.request.contextPath}/resources/ff-ideas/p-5.jpeg" alt="success-story">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="success-story">
                                    <div class="details"></div>
                                    <img src="${pageContext.request.contextPath}/resources/ff-ideas/p-2.jpg" alt="success-story">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="success-story">
                                    <div class="details"></div>
                                    <img src="${pageContext.request.contextPath}/resources/ff-ideas/p-3.jpg" alt="success-story">
                                </div>
                            </div>
                            <div class="grid-item">
                                <div class="success-story">
                                    <div class="details">
                                        <div class="wrap-center">
                                            <div class="name">Aditya Saxena</div>
                                            <div class="age">21</div>
                                            <div class="content">GATE AIR 1</div>
                                        </div>
                                    </div>
                                    <img src="${pageContext.request.contextPath}/resources/ff-ideas/p-1.png" alt="success-story">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> --%>
            <!-- <div class="section" id="testinomials">
                <div class="slider-wrapper">
                    <div class="right-slide-x sslide">
                        <div class="right-slide-view">your content</div>
                        <div class="right-slide-view">your content</div>
                        <div class="right-slide-view">your content</div>
                        <div class="right-slide-view">your content</div>
                        <div class="right-slide-view">your content</div>
                        <div class="right-slide-view">your content</div>
                    </div>
                    <div class="left-slide-x sslide">
                        <div class="right-slide-view">your content</div>
                        <div class="right-slide-view">your content</div>
                        <div class="right-slide-view">your content</div>
                        <div class="right-slide-view">your content</div>
                        <div class="right-slide-view">your content</div>
                        <div class="right-slide-view">your content</div>
                    </div>
                </div>
            </div> -->
            <div class="section fp-auto-height" data-anchor="last">
            	<%@ include file="footer-all.jsp" %>  
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.2.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/2.9.7/jquery.fullpage.extensions.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/particles.js@2.0.0/particles.min.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/masonry/4.2.2/masonry.pkgd.min.js"></script>
       <script src="${pageContext.request.contextPath}/resources/test-admin-panel/js/off-canvas.js"></script>
  		<script src="${pageContext.request.contextPath}/resources/tooltipster/dist/js/tooltipster.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
        
        <script>
	        $(window).on("load", function() {
	    		// Animate loader off screen
	    		$(".se-pre-con").fadeOut("slow");
	    		console.log("stop");
	    	});
            $(function() {
				
            	/********* SET ARTICLE MENU *********/
            	let nav = $("#nav").val();
            	console.log(nav);
            	if (nav.length > 0) {
            		nav = JSON.parse(nav);
            		console.log(nav);
            		nav.forEach((cat) => {
            			let li = $("<li>", {
            				class: "nav-item dropdown active"
            			}).appendTo($("#categories"));
            			
            			let a = $("<a>", {
            				class: "nav-link dropdown-toggle",
            				//href: "/articles/" + cat.value,
            				id: cat.value,
            				"data-toggle":"dropdown",
                            "aria-haspopup": "true",
                            "aria-expanded": "false"
            			}).appendTo(li);
            			a.text(cat.name);
            			
            			let div = $("<div>", {
            				 class: "dropdown-menu dropdown-menu-right",
            				 "aria-labelledby": cat.value
            			}).appendTo(li);
            			
            			if (cat.sub_category.length > 0) {
            				cat.sub_category.forEach((sub_cat) => {
            					let a = $("<a>", {
            						class: "dropdown-item",
            						href: "/articles/" + cat.value + "/" + sub_cat.value
            					}).appendTo(div);
            					a.text(sub_cat.name);
            				})
            			}
            			
            			
            		});
            	}
            	/********* SET ARTICLE MENU *********/

            	
            	
                $('.tooltipp').tooltipster({
                   
                    contentAsHTML: true,
                    trigger: 'hover',
                    animation: 'fade',
                    delay: 200,
                    width: 300
                });
                $('.grid').masonry({
                    // options
                    itemSelector: '.grid-item',
                    columnWidth: 200,
                    gutter: 5
                });
                
                $("#next").on("click", function() {
                	    $.fn.fullpage.moveSectionDown();
                })
                
                $('.slick').slick({
                	  infinite: true,
                	  center: false,
                	  slidesToShow: 3,
                	  slidesToScroll: 3,
                	  responsive: [
                          {
                            breakpoint: 1024,
                            settings: {
                              slidesToShow: 3,
                              slidesToScroll: 3,
                              infinite: true,
                              dots: true
                            }
                          },
                          {
                            breakpoint: 600,
                            settings: {
                              slidesToShow: 2,
                              slidesToScroll: 2
                            }
                          },
                          {
                            breakpoint: 480,
                            settings: {
                              slidesToShow: 1,
                              slidesToScroll: 1
                            }
                          }
                      ],
                	  prevArrow:"<div class='n-btn prev-btn'><i class='fas fa-angle-left'></i></div>",
                      nextArrow:"<div class='n-btn next-btn'><i class='fas fa-angle-right'></i></div>"
                	});

            });
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
					if (event.target.id === "l-btn" || event.target.id === "r-btn") {
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

            	 //REMOVE THIS - it's just to show error messages 
            	$form_login.find('input[type="submit"]').on('click', function(event){
            		event.preventDefault();
            		$.ajax({
            			method: "POST",
            			url: "/login",
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
									window.location.href = login.view;
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
            	 
            	$(document).on("click", "#password-reset-btn", function(e) {
            		e.preventDefault();
    				$("#reset-error").hide();

            		let email = $("#reset-email").val();
            		console.log(email.length);
            		if (email.length === 0) {
            			$form_forgot_password.find('input[type="email"]').toggleClass('has-error').next('span').toggleClass('is-visible');
            		} else {
            			$.ajax({
            				method: "POST",
            				url: "/user/api/reset-password",
            				data: {email: email},
            				beforeSend: function() {
            					console.log("sending reset pass");
            					$("#password-reset-btn").val("Checking User...");
            				},
            				success: function(data) {
            					console.log(data);
            					let reset = JSON.parse(data);
            					
            					if (reset.isUser) {
            						if (reset.isMailSent) {
                    					$("#password-reset-btn").val("Passowrd Reset Mail Send. Please Check your Inbox");
                				
            						}
            						else {
                    					$("#password-reset-btn").val("Opps! Please Reloading and Try Again");

            						}
            					}
            					else {
            						$("#reset-error").show();
                					$("#password-reset-btn").val("Reset Password");

            					}
            					
            				},
            				error: function(a, xhr, b) {
            					console.log(a, xhr, b);
            				}
            				
            			})
            		}
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
            				url: "/signup",
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
            $("#take-test").on('click', function(e) {
            	e.preventDefault();
            	$("#register-main").click();
            	return false;
            })
            
            $("#s-app").on("click", function(e) {
            	e.preventDefault();
            	let itn = {};
	           	itn.fName = $("#f-name").val();
	           	itn.lName = $("#l-name").val();
	           	itn.phone = $("#ph-num").val();
	           	itn.email = $("#email").val();
	           	itn.university = $("#university").val();
	           	itn.course = $("#course").val();
	           	itn.semester = $("#semester").val();
	            itn.city = $("#city").val();
	            
	            let error = false;
	            
	            Object.keys(itn).forEach(e => {
	            	if (itn[e].length === 0 ) error = true;
	            });
	            
	            if (error) {
	            	alert("Please Fill All The Fields.")
	            }
	            else {
	            	// make the ajax call
	            	$.ajax({
	            		method: "POST",
	            		url: "/user/apply-internship/api/save",
	            		data: {
	            			firstName: itn.fName,
	            			lastName: itn.lName,
	            			phnNum: itn.phone,
	            			university: itn.university,
	            			course: itn.course,
	            			semester: itn.semester,
	            			email: itn.email,
	            			city: itn.city
	            		},
	            		beforeSend: function() {
	            			$("#s-app").text("Saving Application...")
	            		},
	            		success: function(data) {
	            			if (data) {
	            				let intern = JSON.parse(data);
	            				console.log(data);
	            				if (intern.error) {
	            					$("#s-app").text("Could Not Save Application, Try Again!");
	            				}
	            				else {
	            					$(".internship-form").hide();
	            					$(".saved-msg").show();
	            					$(".saved-msg").slideDown();
	            				}
	            			}
	            		},
	            		error: function(a, xhr, b) {
	            			console.log(a, xhr, b);
	            		}
	            	});
	            }

            });
            
            
        </script>
    </body>
</html>
