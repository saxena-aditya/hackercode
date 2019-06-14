<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${ pageContext.request.contextPath}/resources/css/report.css">

</head>
<body>
    <section>
        <div class="container-fluid">
            <div class="logo">
                <img src="https://hackercode.in/resources/ff-ideas/logo.png" alt="">
            </div>
        </div>
    </section>
    <section>
        <div class="container">
            <div class="row justify-content-md-center">
                <div class="col-md-5" >
                    <div class="card" id="student-details">
                        <div class="card-header">
                            Student Details
                        </div>
                        <div class="card-body d-flex">
                            <div class="usr-avatar">
                                <div class="usr-img">
                                    <img src="${pageContext.request.contextPath}/resources/ff-ideas/${user.getFilePath() }" alt="">
                                </div>
                                <div class="usr-name">
                                    <p><c:out value="${ user.getFirstName() } ${ user.getLastName() }"></c:out><p>
                                </div>
                            </div>
                                <div class="usr-details">
                                        <div class="usr-d-big">
                                            <div class="usr-label"><i class="far fa-envelope"></i>&nbsp;email:</div>
                                            <c:out value="${ user.getUsername() }"></c:out>
                                        </div>
                                        <div class="usr-d">
                                            <div class="usr-label"><i class="far fa-address-book"></i>&nbsp;contact:</div>
                                            +91 9897171001
                                        </div>
                                        <div class="usr-d">
                                            <div class="usr-label"><i class="far fa-calendar-alt"></i>&nbsp;DOB:</div>
                                            19 April 1997
                                        </div>
                                        <div class="usr-d">
                                            <div class="usr-label"><i class="fas fa-university"></i>&nbsp;education:</div>
                                            <c:out value="${user.getInstitute()}"></c:out>
                                        </div> 
                                </div>
                            
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" id="test-details">
                        <div class="card-header">
                            Test Details
                        </div>
                        <div class="card-body">
                            <div class="d-flex ">
                                <div class="usr-d">
                                    <div class="usr-label"><i class="fas fa-signature"></i>&nbsp;name:</div>
                                   	<c:out value="${test.getName() }"></c:out>
                                </div>
                                <div class="usr-d">
                                    <div class="usr-label"><i class="fas fa-fingerprint"></i>&nbsp;code:</div>
                                    <c:out value="${test.getCode() }"></c:out>
                                </div>  
                            </div>
                            <div class="d-flex">
                                <div class="usr-d">
                                    <div class="usr-label"><i class="fas fa-user-shield"></i>&nbsp;created by:</div>
                                    <c:out value="${test.getAdmin() }"></c:out>
                                </div>
                                <div class="usr-d">
                                    <div class="usr-label"><i class="far fa-clock"></i>&nbsp;total time:</div>
                                    <c:set value="${test.getTotalTime() }" var="sec"></c:set>
                                    <c:set value="${ (sec/ (1000*60*60))%24 }" var="hours"></c:set>
                                    <c:set value="${ (sec/60) % 60 }" var="mins"></c:set>
                                    
                                	<c:set var = "hr" value = "${fn:split(hours, '.')}" />
                                	<c:set var = "mi" value = "${fn:split(mins, '.')}" />
                                	
                                	<c:set var="month" value="Jan,Feb,March,Apr,May,June,July,Aug,Sept,Oct,Nov,Dec" />
                                	<c:set var = "mnt" value = "${fn:split(month, ',')}" />
                                	
                                    <c:out value="${ hr[0] }hours, ${ mi[0] }mins"></c:out>
                                </div>
                            </div>
                            <div class="d-flex">
                                <div class="usr-d">
                                 <c:set var = "stTime" value = "${ test.getStartTime() }"/>
							      <c:set var = "stDate" value = "${fn:split(stTime, ' ')}" />
							   	  <c:set var = "stDate2" value = "${fn:split(stDate[0], '-')}" />
							      
							      <c:set var="eT" value="${ stDate }" />
                                	
							        <div class="usr-label"><i class="far fa-clock"></i>&nbsp;start date:</div>
                                    <c:out value="${ stDate2[2] } ${ mnt[stDate2[1] - 1] } ${ stDate2[0] }"></c:out>
                                </div>
                                 <c:set var = "endTime" value = "${ test.getEndTime() }"/>
							      <c:set var = "endDate" value = "${fn:split(stTime, ' ')}" />
							  	 <c:set var = "endDate2" value = "${fn:split(endDate[0], '-')}" />
							      
                                <div class="usr-d">
                                    <div class="usr-label"><i class="far fa-clock"></i>&nbsp;end time:</div>
                                    <c:out value="${ endDate2[2] } ${ mnt[endDate2[1] - 1] } ${ endDate2[0] }"></c:out>
                                </div>
                            </div>
                            <div class="usr-d">
                                <div class="usr-label"><i class="fas fa-ribbon"></i>&nbsp;related course:</div>
                                <c:out value="${ course.getName() }"></c:out>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section id="summary">
        <div class="container">
            <div class="row offset-md-2">

                <div class="col-md-3">
                    <div class="usr-normal">rank</div>
                    <span class="num-big">3</span>/56
                </div>
                <div class="col-md-3">
                    <div class="usr-normal">total score</div>
                    <span class="num-big"><c:out value="${ ft.getMarks() }"></c:out></span>/<c:out value="${ ft.getMaxMarks() }"></c:out>
                </div>
                <div class="col-md-3">
                    <div class="usr-normal">questions</div>
                    <span class="num-big"><c:out value="${ aq }"></c:out></span>/<c:out value="${fn:length(questions)}"></c:out>
                </div>
            </div>
        </div>
    </section>
    <section>
	    <div class="container">
	   		<div class="row">
		   	 	<div class="col-md-6">
		    		<canvas id="set-wise" ></canvas>
		    	</div>
		    	<div class="col-md-6">
		    		<canvas id="questions-attempt"></canvas>
		    	</div>
	    	</div>
	    </div>
    </section>
    <section>
        <div class="container d-report">
            <div class="section-heading">
                Detailed Submition Report
            </div>
            <div class="question">
                <div class="d-flex q-top-shelf">
                    <div class="q-num">#</div>
                    <div class="q-content">Question</div>
                    <div class="q-result">Result</div>
                    <div class="q-details">Marks</div>
                </div>
                  <c:forEach items="${questions}" var="q" varStatus="loop">
				       <div class="d-flex q-border-bottom">
		                    <div class="q-num"><c:out value="${ loop.index + 1}"></c:out>.</div>
		                    <div class="q-content">
		                        <div class="q-text">
		                            <c:out value="${ q.getQuestionContent() }"></c:out>
		                        </div>
		                        <div class="q-options">
		                            <span class="sub-head">options</span>
		                            <c:set var = "opStr" value = "${ q.getQuestionOptions() }"/>
							      	<c:set var = "options" value = "${fn:split(opStr, '@')}" />
		                            <ul class="op-list">
		                            <c:forEach items="${ options }" var="op">
		                            	<c:choose>
									    	<c:when test="${q.getQuestionAns() == q.getUserAns()}">
									    		<c:choose>
										    		<c:when test="${op == q.getQuestionAns() }">
										    			<li class="c-user-right"><c:out value="${ op }"></c:out></li>
										    		</c:when>
										    		<c:otherwise>
										    				<li><c:out value="${ op }"></c:out></li>
										    		</c:otherwise>
									    		</c:choose>
								     		</c:when>
									    	<c:otherwise>
									    		<c:choose>
									    			<c:when test="${ op == q.getUserAns() }">
									    				<li class="c-user-wrong"><c:out value="${ op }"></c:out></li>
									    			</c:when>
									    			<c:otherwise>
									    				<c:choose>
									    					<c:when test="${ op == q.getQuestionAns() }">
									    						<li class="c-right"><c:out value="${ op }"></c:out></li>
									    					</c:when>
									    					<c:otherwise>
									    						<li><c:out value="${ op }"></c:out></li>
									    					</c:otherwise>
									    				</c:choose>
									    			</c:otherwise>
									    		</c:choose>
									    	</c:otherwise>
										</c:choose>
		                            </c:forEach>
		                                <!-- <li class="c-right">Option 1</li>
		                                <li class="c-user-wrong">Option 2</li>
		                                <li>Option 3</li>
		                                <li class="c-user-right">Option 4</li> -->
		                            </ul>
		                            
		                        </div>
		                    </div>
		                    <div class="q-result">
		                    <c:choose>
		                    	<c:when test="${ q.isAnswered() }">
		                    		<c:choose>
			                        	<c:when test="${ q.getUserAns() == q.getQuestionAns() }">
			                     			<i class="far fa-check-circle right"></i>
			                        	</c:when>
			                        	<c:otherwise>
			                        		<i class="far fa-times-circle wrong"></i>
			                        	</c:otherwise>
		                        	</c:choose>
		                    	</c:when>
		                    	<c:otherwise>
		                    		--
		                    	</c:otherwise>
		                    </c:choose>
		                        
		                    </div>
		                    <div class="q-details">
		                     <c:choose>
		                    	<c:when test="${ q.isAnswered() }">
		                    		 <c:choose>
			                        	<c:when test="${ q.getUserAns() == q.getQuestionAns() }">
			                     			<c:out value="${ q.getQuestionMaxMarks() }"></c:out>/<c:out value="${ q.getQuestionMaxMarks() }"></c:out>
			                        	</c:when>
			                        	<c:otherwise>
			                        		<c:out value="-${ q.getQuestionNegMarks() }"></c:out>/<c:out value="${ q.getQuestionMaxMarks() }"></c:out>
			                        	</c:otherwise>
		                       		 </c:choose>
		                    	</c:when>
		                    	<c:otherwise>
		                    		--
		                    	</c:otherwise>
		                    </c:choose>
		                    	
		                     
		                       
		                    </div>
	
		                </div>
				    </c:forEach>

            </div>

        </div>   
        <input type="hidden" id="graph-data" value='${ str }'/>     
    </section>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<<script src="${ pageContext.request.contextPath }/resources/js/report.js"></script>

</body>
</html>