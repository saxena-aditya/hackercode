<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Hackercode Drafter</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/drafter/index.css">
    
    <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.css">
    <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.2/css/select2.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/css/iziToast.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.15.8/styles/github.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footer.css">

<script src="https://kit.fontawesome.com/61566470d1.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="/">
        	<img src="${ pageContext.request.contextPath }/resources/ff-ideas/logo.png" style="max-height: 70px;margin:3% 5%;">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <!-- <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li> -->
                <!-- <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li> -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">
                       <img src="http://www.top-madagascar.com/assets/images/admin/user-admin.png" alt="user-avatar" style="max-height: 45px;"
/>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                       <!--  <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a> -->
                        <!-- <div class="dropdown-divider"></div> -->
                        <a class="dropdown-item" href = "${ pageContext.request.contextPath }/logout">Logout</a>
                    </div>
                </li>
                
            </ul>
    </nav>
    <div class="container-fluid main-canvas">
        <div class="row">
            <div class="col-md-3">
                <div class="col-head pre-head">
                    <p>Previous Articles <span><i class="fas fa-history"></i></span></p>
                </div>
                <div class="col-content">
                	<c:forEach items="${ articles }" var = "a">
                	</c:forEach>
                    <div class="prev-article">
                        <div class="name">Finding the most common Sub Devisor</div>
                        <div class="tags">
                            <span class="tag">Web Devlopment</span>
                            <span class="tag">Full-Stack Development</span>
                            <span class="tag">Algorithms</span>
                        </div>
                        <div class="details d-flex justify-content-between">
                            <div class="date"><i class="fas fa-calendar-week"></i> 22 April 2016</div>
                            <div class="views"><i class="fas fa-eye"></i> 16 Views</div>
                            <div class="text"><i class="fas fa-check-circle green"></i> Approved</div>
                        </div>
                    </div>
                    <div class="prev-article">
                        <div class="name">Finding the most common Sub Devisor</div>
                        <div class="tags">
                            <span class="tag bg-purple">Web Devlopment</span>
                            <span class="tag bg-orange">Full-Stack Development</span>
                            <span class="tag bg-red">Algorithms</span>
                        </div>
                        <div class="details d-flex justify-content-between">
                            <div class="date"><i class="fas fa-calendar-week"></i> 22 April 2016</div>
                            <div class="views"><i class="fas fa-eye"></i> 16 Views</div>
                            <div class="text"><i class="fas fa-circle-notch red"></i> Pending</div>
                        </div>
                    </div>
                    <div class="prev-article">
                        <div class="name">Finding the most common Sub Devisor</div>
                        <div class="tags">
                            <span class="tag">Web Devlopment</span>
                            <span class="tag">Full-Stack Development</span>
                            <span class="tag">Algorithms</span>
                        </div>
                        <div class="details d-flex justify-content-between">
                            <div class="date"><i class="fas fa-calendar-week"></i> 22 April 2016</div>
                            <div class="views"><i class="fas fa-eye"></i> 16 Views</div>
                            <div class="text"><i class="fas fa-check-circle green"></i> Approved</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="col-head d-flex">
                    <div class="form-group header-inp">
                        <label>Article Heading:</label>
                        <input type="text" class="form-control head-inp a-title" placeholder="Write your article heading here" required="required">
                    </div>
                    <div>
                        <button class="btn btn-success sub-article">Submit <i class="fas fa-plus"></i></button>
                    </div>
                </div>
                <div class="col-content" style="padding: 15px 0 15px 15px;">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="">Select Tags: (comma seperated)</label>
                                <select class="form-control a-tags" multiple="multiple">
                                    <option>orange</option>
                                    <option>white</option>
                                    <option>purple</option>
                                </select>
                            </div>
                        </div> 
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Category:</label>
                                <select class="form-control a-cat" id="cat">
                                	<option value="0" disabled selected>Select Category</option>
                                   <c:forEach items="${categories}" var="cat">
                                   		<option value="${ cat.getId() }">${ cat.getName() }</option>
                                   </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>Sub Category</label>
                                <select class="form-control a-sub-cat" id="sub-cat">
                                    
                                </select>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div id="summernote">
                                
                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="col-head pre-head">
                    <p>Instructions <span><i class="fas fa-info"></i></span></p>
                </div>
                <div class="col-content">
                    <ul>
                        <li>Consider <b>ARTICLE HEADING</b> as Title of Article. <b>TAGS</b> as relevant topics of article, <b>CATEGORY</b> as main subject of article and <b>SUB-CATEGORY</b> as sub-topic of your subject. Eg. <i>ARTICLE HEADING</i> as Introduction on Bubble sort, <i>TAGS</i> as sorting, algo, bubble sort. <i>CATEGORY</i> as Algorithms and <i>SUB-CATEGORY</i> as Sorting.</li>
                        <li>Use the Editor only for writing the article. If you wish to write a code inside the article use <b>&lt;/&gt;</b> (code view) button and write your code inside <b>&lt;pre&gt;&lt;code&gt;  &lt;/pre&gt;&lt;/code&gt;</b> tag only. <br>Eg. <b>&lt;pre&gt;&lt;code&gt; #include&lt;iostream&gt; <br> int main(){}<br> &lt;/pre&gt;&lt;/code&gt;</b></li>
                        <li>Plagiarism % of an article should not be greater 15% in any case.</li>
                        <li>For any questions or doubts, Please write us at hackercode.19@gmail.com with a subject "Doubt on Drafter Account".</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    </div>
   	<%@ include file="footer-all.jsp" %>  
  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.2/js/select2.full.min.js"></script>
    <!-- include codemirror (codemirror.css, codemirror.js, xml.js, formatting.js) -->
    
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.js"></script>
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.js"></script>
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.15.8/highlight.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/js/iziToast.min.js"></script>
    
    <script src="${ pageContext.request.contextPath }/resources/drafter/index.js"></script>
    <script>hljs.initHighlightingOnLoad();</script>

</body>
</html>