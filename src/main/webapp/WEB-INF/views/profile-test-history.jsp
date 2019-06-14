<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<div class="exam-table  table-responsive">
                    	<table class="table table-stripe table-bordered">
                    		<thead>
                    			<tr>
                    				<th>Exam Name</th>
                    				<th>Test Date</th>
                    				<th>Total Marks</th>
                    				<th>Result</th>
                    				<th>Report</th>
                    			</tr>
                    		</thead>
                    		<tbody>
                    		<c:forEach items="${tests}" var="test">
								
                    			<tr>
                    				<td>${ test.getTestName() }</td>
                    				<td class="date-convert">${ test.getDate() }</td>
                    				<td>${ test.getMaxMarks() }</td>
                    				<td>
                    					<div class="result-badge-container">
                    						<div class="result">
                    							<p>${ test.getMarks() }</p>
                    						</div>
                    					</div>
                    				</td>
                    				<td><a class="r-btn" href="${ pageConext.request.contextPath }/reports/${test.getTestCode()}?username=${user.getUsername()}">
                    					View Report
                    				</a></td>
                    			</tr>
							</c:forEach>
                    		</tbody>

                    	</table>
                    </div>