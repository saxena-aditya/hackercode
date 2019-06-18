<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>HackerCode | Article</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.15.8/styles/github.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
    integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">
    
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/article/index.css">
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
				
            </div>
            <div class="col-md-6 article-col">

                <div class="article-head">
                    ${ article.getTitle() }
                    <div class="tags">
                    	<input type="hidden" id="h-tags" value = "${ article.getTags() }"/>
                    	<input type="hidden" id="nav" value = ''/>
                    </div>
                </div>
                <hr>
                <div class="article-content">
            		${ article.getContent() }
                </div>

            </div>
            <div class="col-md-3 courses">
            	
            </div>
        </div>
    </div>
 
    <%@ include file="footer-all.jsp" %>  
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.15.8/highlight.min.js"></script>
    <script>hljs.initHighlightingOnLoad();</script>
    <script src="${ pageContext.request.contextPath }/resources/article/index.js"></script>

</body>
</html>