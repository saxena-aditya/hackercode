<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<div class="take-exam-table table-responsive">
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
           <td>${test.getTotalTime().toString()}</td>
           <td><p class="vaild-till-date">${test.getEndTime().toString()}</p></td>
           <td>
               <a class="take-test-btn btn btn-success"  id="test-1" href="${pageContext.request.contextPath}/give-test/${test.getTestId().toString()}" >
                   Take Test
               </a>
           </td>
       </tr>
       </c:forEach>
   </tbody>
 </table>
</div>  