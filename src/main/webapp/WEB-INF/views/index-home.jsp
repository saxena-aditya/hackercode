<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<!doctype html>
<html class="no-js" lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Hackercode.in</title>
<!--         <meta name="viewport" content="width=device-width, initial-scale=1">
 -->        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
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
          
    </head>
    <body>
    <div class="se-pre-con"></div>
    
        <ul id="menu-hack">
            <li data-menuanchor="firstPage">
                <a href="#firstPage">Register</a>
            </li>
            <li data-menuanchor="secondPage">
                <a href="#" data-toggle="modal" data-target="#login-modal">Login</a>
            </li>
        </ul>
        <!-- The Modal -->
<div class="modal" id="login-modal">
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
</div>
        <div id="fullpage">
            <div class="section" data-anchor="sec-front">
                <div id="particles-js"></div>
                <img src="${pageContext.request.contextPath}/resources/ff-ideas/logo.png" id="owl-graph" alt="">
                <img src="${pageContext.request.contextPath}/resources/ff-ideas/bulb-front.png" alt="" id="bulb-front">
                <div class="head-area">
                    <h4>welcome to,
                </h4>
                    <h1>
                        <i class="fas fa-angle-left"></i>
                        HackerCode
                        <i class="fas fa-angle-right"></i>
                        
                    </h1>
                    <h3>Tomorrow starts here with Hacker Code. A platform for computer enthusiasts who imagine the impossible and make a difference. Be uniquely you and dive in the world of coding and learn what you require, push your limits, while(!(success==try()), test yourself. Code with ease and experience a greater measure of confidence with Hacker Code. 
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
                            <a href="" class="choice-ans" data-toggle="modal" data-target="#login-modal">Take Test</a>

                        </span>
                    </div>
                </div>
            </div>
            <div class="section" data-anchor="sec-courses-info">
                <div class="wrapper d-flex flex-wrap">
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
                                        <div class="row slick">
                                        <c:forEach items="${courses}" var="c">
										    <div class="col-md-xxc">
                                                <div class="card">
                                                    <img src="https://i.udemycdn.com/course/240x135/1362070_b9a1_2.jpg" alt="" class="card-img-top">
                                                    <div class="card-body">
                                                        <div class="card-title"><c:out value="${c.getName()}"/>
                                                </div>
                                                        <div class="card-text">
                                                            <div class="course-type-bar d-flex justify-content-start">
                                                                <div class="inf">Web Development
                                                        </div>
                                                            </div>
                                                            <div class="course-info-bar d-flex justify-content-between">
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
                                                            <div class="course-ratings d-flex justify-content-between">
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
                                                            <div class="price-details d-flex justify-content-between">
                                                                <div class="price">
                                                                    <span class="was-price">
                                                                        <i class="fas fa-rupee-sign sm-icon"></i>
                                                                        1200
                                                            
                                                                    
                                                                    </span>
                                                                    <span class="is-price">
                                                                        <i class="fas fa-rupee-sign"></i>
                                                                        <c:out value="${c.getPrice()}"/>
                                                            
                                                                    
                                                                    </span>
                                                                </div>
                                                                <div class="details">
                                                                    <span id="tooltipp">
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
                                <div class="testinomial d-flex">
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
                                <div class="testinomial d-flex">
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
                                <div class="testinomial d-flex">
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
                    <div id="tooltip_content">
                        <div class="card">
                            <div class="card-header">
                                <h5>HTML, CSS Beginer Course To get you started</h5>
                            </div>
                            <div class="card-body">
                                <div class="card-text">
                                    <div class="course-type-bar d-flex justify-content-start">
                                        <div class="inf">Web Development
                                </div>
                                    </div>
                                    <div class="course-info-bar d-flex justify-content-between">
                                        <div class="time inf">
                                            <i class="far fa-clock sm-icon"></i>
                                            300 mins
                                
                                        
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
                                        <div class="course-desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus consequatur ratione laborum ad, nobis et.
                                </div>
                                        <div class="course-guid-list">
                                            <ol>
                                                <li>Lorem ipsum dolor sit amet, elit.</li>
                                                <li>Lorem ipsum dolor sit amet, conse adipi elit.</li>
                                                <li>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</li>
                                            </ol>
                                        </div>
                                    </div>
                                    <div class="price-details d-flex justify-content-between">
                                        <div class="price">
                                            <span class="was-price">
                                                <i class="fas fa-rupee-sign sm-icon"></i>
                                                1200
                                    
                                            
                                            </span>
                                            <span class="is-price">
                                                <i class="fas fa-rupee-sign"></i>
                                                400
                                    
                                            
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
                </div>
            </div>
            <div class="section" data-anchor="sec-info">
                <div class="lms">
                    <div class="lms-img">
                        <img id="lms-design" src="${pageContext.request.contextPath}/resources/ff-ideas/160-design.svg" alt="">
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
                            <div class="lms-features d-flex">
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
            <div class="section" data-anchor="sec-team">
                <div class="row">
                    <div class="col-md-5">
                        <div class="team"></div>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="team">
                                <div class="header">
                                    <h2>Meet the team</h2>
                                </div>
                                <div class="desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse quas libero consequuntur, sed, aspernatur id veritatis possimus. Architecto beatae recusandae, cum ea odio qui voluptate, quia cupiditate quam blanditiis minima.
                      </div>
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
                                        <div class="name">Aditya Saxena</div>
                                        <div class="designation">Full Stack Developer</div>
                                        <div class="desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium, ducimus quae. Earum inventore minus.</div>
                                        <div class="links">
                                            <ul>
                                               <li>
                                               		<i class="fab fa-facebook fb"></i>
                                               </li>
                                                <li>
                                                    <i class="fab fa-github git"></i>
                                                </li>
                                                <li>
                                                    <i class="fab fa-linkedin ln"></i>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <div class="member">
                                        <div class="img">
                                            <img src="${pageContext.request.contextPath}/resources/ff-ideas/p-6.jpg" alt="member">
                                        </div>
                                        <div class="name">Aditya Saxena</div>
                                        <div class="designation">Full Stack Developer</div>
                                        <div class="desc">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium, ducimus quae. Earum inventore minus.</div>
                                        <div class="links">
                                            <ul>
                                                <li>
                                                	<i class="fab fa-facebook fb"></i>
                                                </li>
                                                <li>
                                                    <i class="fab fa-github git"></i> 
                                                </li>
                                                <li>
                                                    <i class="fab fa-linkedin ln"></i>
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
            </div>
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
                $('#tooltipp').tooltipster({
                    content: $("#tooltip_content"),
                    contentCloning: true,
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
                	  prevArrow:"<div class='n-btn prev-btn'><i class='fas fa-angle-left'></i></div>",
                      nextArrow:"<div class='n-btn next-btn'><i class='fas fa-angle-right'></i></div>"
                	});
                		

            })
        </script>
    </body>
</html>
