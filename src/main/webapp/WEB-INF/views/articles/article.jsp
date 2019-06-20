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
    <title>HackerCode | Article</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.15.8/styles/github.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
    integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css?id="${rand}" >
    
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/article/index.css?id=${rand}">
</head>
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
            
        </div>
        <div class="collapse navbar-collapse" id="navbarsExample09">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
            	<a href="#" class="nav-link nav-btn">Exercises</a>
            </li>
          </ul>
        </div>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3">
				<div class="dd">
	                <div class="col-head">
	                    <img id="a-img" src="https://cdn4.iconfinder.com/data/icons/seo-and-development/155/vector_257_04-01-512.png" alt="">
	                    <span>Related Articles</span>
	                </div>
	                <hr>
	                <div class="article-list">
	                <c:forEach items = "${ similarArticles }" var="a">
	                	<div class="article">
	                	<c:set var = "str" value = "${ a.getTitle() }"/>
	                	<c:set var = "str" value = "${fn:toLowerCase(str)}" />
	                	
      					<c:set var = "title" value = "${fn:replace(str, ' ', '-')}" />
	                        <div class="name"><a href="${ pageContext.request.contextPath }/article/${a.getId_hash()}/${title}">${ a.getTitle() }</a> </div>
	                        <div class="details d-flex">
	                            <div class="date"><i class="fas fa-calendar-week"></i> 26 April 2018</div>
	                            <div class="visits"><i class="fas fa-eye"></i> 50 views</div>
	                        </div>
	                    </div>
	                </c:forEach>
	                    
	                   
	                </div>
                </div>
            </div>
            <div class="col-md-6 article-col">

                <div class="article-head">
                    ${ article.getTitle() }
                    <div class="tags">
                    	<input type="hidden" id="h-tags" value = "${ article.getTags() }"/>
                    	<input type="hidden" id="nav" value = '${ nav }'/>
                    </div>
                </div>
                <hr>
                <div class="article-content">
            		${ article.getContent() }
                </div>

            </div>
            <div class="col-md-3 courses">
            	<div class="dd">	
	            	<c:forEach items="${ courses }" var="c">
	            		<div class="card course">
                        <img src="${ c.getCover() }" alt=""
                            class="card-img-top">
                        <div class="card-body">
                            <div class="card-title">${ c.getName() }
                            </div>
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
                                        ${ c.getLessonCount() } lectures
                    
                                    </div>
                                    <div class="level inf">
                                        <i class="fas fa-level-up-alt"></i>
                                        beginer
                    
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
                                            ${ c.getPrice() }
                    
                    
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
	            	</c:forEach>
            	</div>
            </div>
        </div>
    </div>
    <!-- <pre>
        <code>
            #include &lt;stdio.h&gt;
            using namespace std;

            int main() {
                int i;
                cin >> i;
                cout << i << endl;
                return 0;
            }
        </code>
    </pre> -->
    <%@ include file="../footer-all.jsp" %>  
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.15.8/highlight.min.js"></script>
    <script>hljs.initHighlightingOnLoad();</script>
    <script src="${ pageContext.request.contextPath }/resources/article/index.js?id=${rand}"></script>

</body>
</html>