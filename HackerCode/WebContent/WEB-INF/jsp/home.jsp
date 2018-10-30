<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Carousel Template for Bootstrap</title>
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700" rel="stylesheet">
        <!-- Custom styles for this template -->
        <!--<link href="carousel.css" rel="stylesheet">-->
    </head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Failed</title>
</head>   <body>
        <header>
            <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-white">
                <a class="navbar-brand" href="#">
                    <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="HackerCode" id="logopic">
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav ml-auto">
                        <!-- <li class="nav-item dropdown">
                    <a class="nav-link-dark dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Dropdown
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                    </div>
                </li> -->
                        <li class="nav-item">
                            <a class="nav-link-dark" href="{{ url('/register') }}">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link-dark" href="{{ url('/register') }}">Contact Us</a>
                        </li>
                        <li class="nav-item btn-classic-o">
                            <a class="nav-link-dark" href="{{ url('/register') }}">Register</a>
                        </li>
                        <li class="nav-item btn-classic">
                            <a class="nav-link-dark" href="{{ url('/login') }}">Login</a>
                        </li>
                    </ul>
                    <!--  <form class="form-inline mt-2 mt-md-0">
           <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
           <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
         </form> -->
                </div>
            </nav>
            <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-white navbar-secondary">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav">
                        <!-- <li class="nav-item dropdown">
                    <a class="nav-link-dark dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Dropdown
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                    </div>
                </li> -->
                        <li class="nav-item">
                            <a class="nav-link-dark" href="{{ url('/register') }}">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link-dark" href="{{ url('/register') }}">Contact Us</a>
                        </li>
                        <li class="nav-item btn-classic-o">
                            <a class="nav-link-dark" href="{{ url('/register') }}">Register</a>
                        </li>
                    </ul>
                    <!--  <form class="form-inline mt-2 mt-md-0">
           <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
           <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
         </form> -->
                </div>
            </nav>
        </header>
        <main role="main">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="first-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="First slide">
                        <div class="container">
                            <div class="carousel-caption text-left">
                                <h1>Example headline.</h1>
                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                                <p>
                                    <a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="second-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Second slide">
                        <div class="container">
                            <div class="carousel-caption">
                                <h1>Another example headline.</h1>
                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                                <p>
                                    <a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="third-slide" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Third slide">
                        <div class="container">
                            <div class="carousel-caption text-right">
                                <h1>One more for good measure.</h1>
                                <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                                <p>
                                    <a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="help-you">
                <div class="container">
                    <div class="row">
                        <div class="col text-center">
                            <h1>
                                How can <span class="blue-c">Hacker</span>
                                <span class="orange-c">Code</span>
                                help you 
                                
                                <span id="big-question-mark">
                                    ?<span>
                            </h1>
                        </div>
                    </div>
                    <div class="row justify-content-md-center text-center marg-top">
                        <div class="col">
                            <div class="section-head">
                                <h3>
                                    <a href="#">GATE
                  </a>
                                </h3>
                            </div>
                        </div>
                        <div class="col ">
                            <div class="section-head">
                                <h3>
                                    <a href="#">GRE
                  </a>
                                </h3>
                            </div>
                        </div>
                        <div class="col ">
                            <div class="section-head">
                                <h3>
                                    <a href="#">PLACEMENTS
                  </a>
                                </h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <section id=timeline>
                <h1>A Flexbox Timeline</h1>
                <p class="leader">All cards must be the same height and width for space calculations on large screens.</p>
                <div class="demo-card-wrapper">
                    <div class="demo-card demo-card--step1">
                        <div class="head">
                            <div class="number-box">
                                <span>01</span>
                            </div>
                            <h2>
                                <span class="small">Subtitle</span>
                                Technology
                            
                            </h2>
                        </div>
                        <div class="body">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta reiciendis deserunt doloribus consequatur, laudantium odio dolorum laboriosam.</p>
                            <img src="http://placehold.it/1000x500" alt="Graphic">
                        </div>
                    </div>
                    <div class="demo-card demo-card--step2">
                        <div class="head">
                            <div class="number-box">
                                <span>02</span>
                            </div>
                            <h2>
                                <span class="small">Subtitle</span>
                                Confidence
                            
                            </h2>
                        </div>
                        <div class="body">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta reiciendis deserunt doloribus consequatur, laudantium odio dolorum laboriosam.</p>
                            <img src="http://placehold.it/1000x500" alt="Graphic">
                        </div>
                    </div>
                    <div class="demo-card demo-card--step3">
                        <div class="head">
                            <div class="number-box">
                                <span>03</span>
                            </div>
                            <h2>
                                <span class="small">Subtitle</span>
                                Adaptation
                            
                            </h2>
                        </div>
                        <div class="body">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta reiciendis deserunt doloribus consequatur, laudantium odio dolorum laboriosam.</p>
                            <img src="http://placehold.it/1000x500" alt="Graphic">
                        </div>
                    </div>
                    <div class="demo-card demo-card--step4">
                        <div class="head">
                            <div class="number-box">
                                <span>04</span>
                            </div>
                            <h2>
                                <span class="small">Subtitle</span>
                                Consistency
                            
                            </h2>
                        </div>
                        <div class="body">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Soluta reiciendis deserunt doloribus consequatur, laudantium odio dolorum laboriosam.</p>
                            <img src="http://placehold.it/1000x500" alt="Graphic">
                        </div>
                    </div>
                    <div class="demo-card demo-card--step5">
                        <div class="head">
                            <div class="number-box">
                                <span>05</span>
                            </div>
                            <h2>
                                <span class="small">Subtitle</span>
                                Conversion
                            
                            </h2>
                        </div>
                        <div class="body">
                            
                            <img src="http://placehold.it/1000x500" alt="Graphic">
                        </div>
                    </div>
                </div>
            </section>
            <!-- Marketing messaging and featurettes
      ================================================== -->
            <!-- Wrap the rest of the page in another container to center all the content. -->
            <!-- FOOTER -->
        </main>
        <footer>
            <section id="footer">
                <div class="container">
                    <div class="row text-center text-xs-center text-sm-left text-md-left">
                        <div class="col-xs-12 col-sm-4 col-md-4">
                            <h5>Quick links</h5>
                            <ul class="list-unstyled quick-links">
                                <li>
                                    <a href="javascript:void();">
                                        <i class="fa fa-angle-double-right"></i>
                                        Home
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void();">
                                        <i class="fa fa-angle-double-right"></i>
                                        About
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void();">
                                        <i class="fa fa-angle-double-right"></i>
                                        FAQ
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void();">
                                        <i class="fa fa-angle-double-right"></i>
                                        Get Started
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void();">
                                        <i class="fa fa-angle-double-right"></i>
                                        Videos
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4">
                            <h5>Quick links</h5>
                            <ul class="list-unstyled quick-links">
                                <li>
                                    <a href="javascript:void();">
                                        <i class="fa fa-angle-double-right"></i>
                                        Home
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void();">
                                        <i class="fa fa-angle-double-right"></i>
                                        About
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void();">
                                        <i class="fa fa-angle-double-right"></i>
                                        FAQ
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void();">
                                        <i class="fa fa-angle-double-right"></i>
                                        Get Started
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void();">
                                        <i class="fa fa-angle-double-right"></i>
                                        Videos
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4">
                            <h5>Quick links</h5>
                            <ul class="list-unstyled quick-links">
                                <li>
                                    <a href="javascript:void();">
                                        <i class="fa fa-angle-double-right"></i>
                                        Home
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void();">
                                        <i class="fa fa-angle-double-right"></i>
                                        About
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void();">
                                        <i class="fa fa-angle-double-right"></i>
                                        FAQ
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void();">
                                        <i class="fa fa-angle-double-right"></i>
                                        Get Started
                                    </a>
                                </li>
                                <li>
                                    <a href="https://wwwe.sunlimetech.com" title="Design and developed by">
                                        <i class="fa fa-angle-double-right"></i>
                                        Imprint
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-5">
                            <ul class="list-unstyled list-inline social text-center">
                                <li class="list-inline-item">
                                    <a href="javascript:void();">
                                        <i class="fa fa-facebook"></i>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="javascript:void();">
                                        <i class="fa fa-twitter"></i>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="javascript:void();">
                                        <i class="fa fa-instagram"></i>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="javascript:void();">
                                        <i class="fa fa-google-plus"></i>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="javascript:void();" target="_blank">
                                        <i class="fa fa-envelope"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
<hr></div>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center text-white">
        <p>
            <u>
                <a href="https://www.nationaltransaction.com/">National Transaction Corporation</a>
            </u>
            is a Registered MSP/ISO of Elavon, Inc. Georgia [a wholly owned subsidiary of U.S. Bancorp, Minneapolis, MN]
        </p>
        <p class="h6">
            &copy All right Reversed.<a class="text-green ml-2" href="https://www.sunlimetech.com" target="_blank">Sunlimetech</a>
        </p>
    </div>
<hr></div></div></section></footer>
<!-- ./Footer -->
<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
</body></html>