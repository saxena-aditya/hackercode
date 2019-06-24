<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
 <div class="">
 	<div class="">
 		<a href="#reports" id="reports-alt"><i class="far fa-chart-bar"></i>&nbsp;See Reports</a>
 	</div>
 </div>
 <div class="row">
	<div class="take-exam-table table-responsive col-md-8">
	<c:choose>
		<c:when test="${ empty tests}">
			<h1 class="empty-msg">NO TESTS PRESENT</h1>
		</c:when>
		<c:otherwise>
			<table class="table table-stripe table-bordered">
				<thead>
			          <tr>
			              <th>Test</th>
			              <th>Duration</th>
			              <th>Valid Till</th>
			              <th>Take Test</th>
			          </tr>
			    </thead>
			    <tbody>
			       <c:forEach items="${tests}" var="test">
			       <tr>
			           <td><p class="test-name">${test.getName().toString()}</p></td>
			           <td class="time-convert">${test.getTotalTime().toString()}</td>
			           <td><p class="valid-till-date">${test.getEndTime().toString()}</p></td>
			           <td>
			               <a class="take-test-btn btn btn-success" href="${pageContext.request.contextPath}/give-test/${test.getTestId().toString()}" >
			                   Take Test
			               </a>
			           </td>
			       </tr>
			       </c:forEach>
			   </tbody>
			 </table>
		</c:otherwise>
	</c:choose>
  
</div>  
<div class="take-exam-table table-responsive col-md-4">
<c:choose>
	<c:when test="${ empty rTests}">
	</c:when>
	<c:otherwise>
		<table class="table table-stripe table-bordered">
		      <thead>
		          <tr>
		              <th>Test</th>
		              <th>Time Left</th>
		              <th>Valid Till</th>
		              <th>Take Test</th>
		          </tr>
		      </thead>
		      <tbody>
		       <c:forEach items="${rTest}" var="test">
		       <tr>
		           <td><p class="test-name">${test.getName().toString()}</p></td>
		           <td class="time-convert">${test.getTotalTime().toString()}</td>
		           <td><p class="valid-till-date">${test.getEndTime()}</p></td>
		           <td>
		               <a class="take-test-btn btn btn-success" href="${pageContext.request.contextPath}/give-test/${test.getTestId().toString()}" >
		                   Resume
		               </a>
		           </td>
		       </tr>
		       </c:forEach>
		   </tbody>
		 </table>
	</c:otherwise>
</c:choose>

</div>
</div>