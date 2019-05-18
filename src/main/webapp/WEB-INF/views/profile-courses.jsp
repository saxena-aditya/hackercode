<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<div class="row courses-list">
<c:forEach items="${courses}" var="c">
	<div class="col-md-xxcc">
       <div class="card">
           <img src="https://i.udemycdn.com/course/240x135/1362070_b9a1_2.jpg" alt="" class="card-img-top">
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