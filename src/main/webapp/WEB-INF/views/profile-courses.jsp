<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<div class="c-heading title" style="padding: 0 30px;">
	<p>Your Courses</p>
</div>
<div class="row courses-list">

	<c:forEach items="${courses}" var="c">
		<div class="col-md-xxcc">
	       <div class="card">
	           <img src="${ c.getCover() }" alt="" class="card-img-top">
	           <div class="card-body">
	               <div class="card-title">${c.getName()}</div>
	               <div class="card-text">
	                   <div class="course-type-bar d-flex justify-content-start">
	                       <div class="inf">Web Development</div>
	                   </div>
	                   <div class="lec-heading">Lectures</div>
	                   
	                   <div class="lectures-info d-flex justify-content-between">
	                   		<div class="lec">
	                   			<div class="head">
	                   				Remaining
	                   			</div>
	                   			<div class="body">
	                   				${ c.getTotalLessons() - c.getCompletedLessons() }
	                   			</div>
	                   		</div>
	                   		<div class="lec">
	                   			<div class="head">
	                   				Viewed
	                   			</div>
	                   			<div class="body">
	                   				${ c.getCompletedLessons() }
	                   			</div>
	                   		</div>
	                   </div>
	                   <div class="d-flex justify-content-between lec-end">
	                   	<p class="lec-time">19 days left</p>
	                   	<button class="enroll-btn sm-btn course-start-btn" id="${ c.getCode() }">Start</button>
	                   </div>
	               </div>
	           </div>
	       </div>
	   </div>
	</c:forEach>
</div>

<div class="other-courses">
	<div class="c-heading title">
		<p>Other Courses</p>
		<div class="c-bar"></div>
	</div>
	<div class="row slick" style="margin: 0;">
    	<c:forEach items="${otherCourses}" var="c">
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
<script>
</script>