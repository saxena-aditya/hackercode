<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

    
<!DOCTYPE html>
<html lang="en">
<head>
    <c:set var="rand"><%= java.lang.Math.random() %></c:set>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>HackerCode | Search</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css"/>
                 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css"/>
         
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css?id="${rand}" >
            	    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/test-admin-panel/images/favicon.png" />
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/tooltipster/dist/css/tooltipster.bundle.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css?id=${rand}" >
    
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/article/index.css?id=${rand}">
	
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.2.1/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
	      		<script src="${pageContext.request.contextPath}/resources/tooltipster/dist/js/tooltipster.bundle.min.js"></script>
	        
	    
        
</head>
<style>
	.article-tile {
    display: inline-flex;
    border: 1.5px solid;
    margin:0 5px 15px 0;
    padding: 10px 30px;
    box-shadow: 1px 1px 15px #afafaf21;
    
}
.article-tile > .article-link a {
    color: #2f2d2d;
    font-size: 1.2em;
}
.card {
	min-height: 386px; !important
}
.hh-heading {
    font-size: 2em;
    margin: 4% 0 0 0;
}
</style>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="/">
        	  <img src="${ pageContext.request.contextPath }/resources/ff-ideas/logo.png" alt="">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav mr-auto" id="categories">
            </ul>
            <div class="container-">
						  <input type="text" placeholder="Search..." id="search-box">
						  <div class="search"></div>
			</div>
        </div>
        <div class="collapse navbar-collapse" id="navbarsExample09">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
            	<a href="/resources" class="nav-link nav-btn">Exercises</a>
            </li>
          </ul>
        </div>
    </nav>
    <div class="container">
    <input type="hidden" value='${ nav }' id ="nav" />
    <div class="hh-heading">Courses (${courseCount})</div><hr />
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
                                   <c:choose>
										<c:when test="${c.isTestSeries()}">
											${ c.getLessonCount() } test(s)
										</c:when>
										<%-- <c:when test="${condition2}">
										 
										</c:when> --%>
										<c:otherwise>
											${ c.getLessonCount() } lecture(s)
										</c:otherwise>
									</c:choose>
                                 
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
           
           
       </div>
       
    <div class="hh-heading">Articles (${articleCount})</div><hr />
      <c:forEach items = "${ articles }" var="a">
	       <div class="article-tile">
          		<c:set var = "str" value = "${ a.getTitle() }"/>
  				<c:set var = "str" value = "${fn:toLowerCase(str)}" />
  	
				<c:set var = "title" value = "${fn:replace(str, ' ', '-')}" />
          		<div class="article-link">
          			<a href="${ pageContext.request.contextPath }/article/${a.getId_hash()}/${title}">${ a.getTitle() }</a>
           		</div>
      
     	 	</div>
      </c:forEach>
	                    
    </div>
    
    <script>
    
    $('.slick').slick({
    	  infinite: true,
    	  center: true,
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

    </script>
 	<script src="${ pageContext.request.contextPath }/resources/js/make-nav-search.js?id=${rand}"></script>
    
</body>
</html>