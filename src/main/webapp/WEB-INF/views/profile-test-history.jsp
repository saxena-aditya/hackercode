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
                    			</tr>
                    		</thead>
                    		<tbody>
                    			<tr>
                    				<td>10th Social Exam</td>
                    				
                    				<td>01-Mar-2018</td>
                    				<td>100</td>
                    				<td>
                    					<div class="result-badge-container">
                    						<div class="result-badge">
                    							<p>78</p>
                    						</div>
                    					</div>
                    				</td>
                    			</tr>
                    		</tbody>
                    		<c:forEach items="${finishedTest}" var="test">
								<tbody>
                    			<tr>
                    				<td>${ test.getTestId() }</td>
                    				<td>${ test.getDate() }</td>
                    				<td>${ test.getMaxMarks() }</td>
                    				<td>
                    					<div class="result-badge-container">
                    						<div class="result-badge">
                    							<p>${ test.getMarks() }</p>
                    						</div>
                    					</div>
                    				</td>
                    			</tr>
                    		</tbody>
							</c:forEach>
                    	</table>
                    </div>