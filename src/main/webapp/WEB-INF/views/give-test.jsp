<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${ testName }</title>
</head>
<!-- LINKING STYLESHEETS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" />
<link href="https://fonts.googleapis.com/css?family=Karla:400,700" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/give-test/take-test/css/test-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/give-test/take-test/css/instruction-ui.css">

<body>
<div id="snackbar">
	<div id="excl">!</div>
    <div id="snackbar-text"></div>
</div>
<div id="instructions">
	 <div class="layout-container">
            <div class="gray-full-container challenge">
                <div class="about-fold">
                    <div class="about-container row">
                        <div class="left-section col-md-8">
                            <div class="section">
                                <div class="head-container">
                                    <h2 class="dark weight-700 regular caps head">Accessing your online Exam</h2>
                                </div>
                                <div class="section-desc regular dark">
                                    <li>
                                        This is a test of <span>2 hours</span>
                                        duration.
                                    </li>
                                    <li>Total number of question is 50. You will get +3 for every right answer</li>
                                    <li>Please read the insructions carefully</li>
                                </div>
                            </div>
                            <div class="section">
                                <div class="head-container">
                                    <h2 class="dark weight-700 regular caps head">In Case of network Interuption</h2>
                                </div>
                                <div id="instructions-short-desc" class="section-desc regular dark">
                                    <li>For the programming question, you can choose any language from the given list and attempt.</li>
                                    <li>Reconnect to the Internet and log back into Blackboard.</li>
                                    <li>Follow your original instructions to access the exam login page.</li>
                                    <li>Ask your proctor to re-enter the Username and Password, then select the checkbox "Show list of unfinished exams, only select to re-enter an exam already in progress.;This will enable you to resume taking the exam, close to the point before the interruption occurred.</li>
                                    <li>Have your Proctor enter the Username and Password provided in the email from The College and click enter.</li>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 left-section">
                        	 <div class="section">
                                <div class="head-container">
                                    <h2 class="dark weight-700 regular caps head">Know your Buttons</h2>
                                </div>
                                
                                <div class="row">
                                <div class="col-md-6 text-center">
                                    <div class="d-flex">
                                        <button class="normal classic-btn index-btn">1</button>
                                        <p class="index-label">Not Visited</p>
                                    </div>
                                </div>
                                <div class="col-md-6 text-center padding-0">
                                    <div class="d-flex">
                                        <button class="to-review classic-btn index-btn">1</button>
                                        <p class="index-label">Review</p>
                                    </div>
                                </div>
                                <div class="col-md-6 text-center">
                                    <div class="d-flex">
                                        <button class="visited classic-btn index-btn">1</button>
                                        <p class="index-label">Answered</p>
                                    </div>
                                </div>
                                <div class="col-md-6 text-center padding-0">
                                    <div class="d-flex">
                                        <button class="not-answered classic-btn index-btn">1</button>
                                        <p class="index-label">Skipped</p>
                                    </div>
                                </div>
                                <div class="col-md-12 text-center">
                                    <div class="d-flex">
                                        <button class="answered-to-review classic-btn index-btn">1</button>
                                        <p class="index-label">Answered but marked for review</p>
                                    </div>
                                </div>
                            </div>
                                
                                
                            </div>
                        	<div class="top-banner">
                        		<div class="policy-box">
                        			<div class="d-flex policy-box">
                        				<div class="box">
                        					<input type="checkbox" name="policy-control" id="policy">
                        				</div>
                        				<div class="policy">
                        					I agree with the terms and conditions.
                        				</div>
                        			</div>
                        		</div>
                                <button class="btn btn-success btn-sm" id="inst-btn" disabled>
                                	Ready? Launch!
                                </button>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
    <div class="container-fluid" id="test-area">
        <button id="f-screen"><i class="fa fa-arrows-alt"></i>full screen</button>
        <div class="row bg-blue">
            <div class="col-md-12">
                <div class="d-flex justify-content-between">
                    <div class="test-info">
                        <p id="test-name" class="margin-0 fff">${ testName }</p>
                    </div>
                    <div class="test-info-instructions">
                        <p id="test-instrustions" class="margin-0 fff">
                            <i class="fas fa-info-circle fff adjust-padd"></i>
                            Instructions
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row bg-grey">
            <div class="col-md-9">
                <div class="row">
                    <div class="col-md-12 bg-grey">
                        <div class="d-flex question-tags justify-content-between">
                            <div class="d-flex" id="question_type">
                                <div class="tag bg-blue-light">
                                    <p class="margin-0 tag-text fff">General Awareness</p>
                                </div>
                                <div class="tag bg-blue-light">
                                    <p class="margin-0 tag-text fff">Coding</p>
                                </div>
                            </div>
                            <div class="timer">
                                <p id="time-clock" class="margin-0 black">34:15</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="test-type-info">
                            <span id="question">
                                Question Type: <span id="test-type-name">Multiple Choice Questions</span>
                            </span>
                            <span id="marks">
                              <!--MARKS OF EACH QUESTION TO BE APPENDED-->

                            </span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="test-container">
                            <div class="row bg-grey">
                                <div class="col-md-12">
                                    <div class="d-flex justify-content-between">
                                        <div class="current-question">
                                            <p class="question-number-text margin-0">
                                                Question: <span id="question-number">1</span>
                                            </p>
                                        </div>
                                        <!-- <div class="btns">
                                            <button class="btn-class sub-btn" id="submit-btn">Submit<i class="fas fa-check-double fff adjust-padd"></i></button>
                                        </div> -->
                                    </div>
                                </div>
                            </div>
                            <div class="row ">
                                <div class="col-md-12">
                                    <div class="test-q-a-contain bg-white" id="test-container-all">
                                        <div class="test-question">
                                            <p class="question-text" id="quest-text">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sit ad
                                                repudiandae labore, nostrum recusandae iure eligendi cum et sint aut,
                                                ut, illum debitis? Ipsam, provident consequuntur mollitia quasi unde
                                                dignissimos?
                                            </p>
                                        </div>
                                        <div class="test-question-answers">
                                            <input type="radio" class="options" name="options">Lorem Epsium <br>
                                            <input type="radio" class="options" name="options">Option 2 <br>
                                            <input type="radio" class="options" name="options">4533 <br>
                                            <input type="radio" class="options" name="options">123 <br>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row bg-grey">
                                <div class="col-md-12">
                                    <div class="d-flex justify-content-end padding-10">
                                        <button class="btn-class btn" id="review-btn"><i class=""></i>Review</button>
                                        <button class="btn-class btn" id="clear-response-btn">Clear Response</button>
                                        <button class="btn-class pre-btn" id="prev-btn"><i class="fas fa-chevron-left adjust-padd"></i>Previous</button>
                                        <button class="btn-class next-btn" id="next-btn">Submit&Next<i class="fas fa-chevron-right adjust-padd"></i></button>
                                        <button class="btn-class sub-btn" id="submit-btn">Submit<i class="fas fa-check-double fff adjust-padd"></i></button>
                                    
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3 bg-grey height-full">
                <div class="row">
                    <div class="col-md-12">
                        <div class="notice-area">
                            <div id="user_img">
                            </div>
                            <div id="user_id"></div>
                            <hr>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="index-container">
                            <div class="row">
                                <div class="col-md-6 text-center">
                                    <div class="d-flex">
                                        <button class="normal classic-btn index-btn">1</button>
                                        <p class="index-label">Not Visited</p>
                                    </div>
                                </div>
                                <div class="col-md-6 text-center padding-0">
                                    <div class="d-flex">
                                        <button class="to-review classic-btn index-btn">1</button>
                                        <p class="index-label">Review</p>
                                    </div>
                                </div>
                                <div class="col-md-6 text-center">
                                    <div class="d-flex">
                                        <button class="visited classic-btn index-btn">1</button>
                                        <p class="index-label">Answered</p>
                                    </div>
                                </div>
                                <div class="col-md-6 text-center padding-0">
                                    <div class="d-flex">
                                        <button class="not-answered classic-btn index-btn">1</button>
                                        <p class="index-label">Skipped</p>
                                    </div>
                                </div>
                                <div class="col-md-12 text-center">
                                    <div class="d-flex">
                                        <button class="answered-to-review classic-btn index-btn">1</button>
                                        <p class="index-label">Answered but marked for review</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                    </div>
                </div>
                <div class="row">
                    <div class="question-button-container col-md-10 offset-md-1">
                        <div class="d-flex flex-wrap" id="question-btns">
                          <!-- QUESTIONS ARE ADDED DYNAMICALLY FROM THE SERVER -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	      
	        <h5 class="modal-title" id="exampleModalLabel">Test Submitted Successfully</h5>
	        
	     	      </div>
	      <div class="modal-body">
	        Click to End Test.
	        <br>
	      </div>
	      <div class="modal-footer">
	        <a type="button" href="${pageContext.request.contextPath}/profile" class="btn btn-primary">End Test</a>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- confirm submit modal -->
	<div class="modal fade" id="confirmSubmitModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Are You Sure to Submit</h5>
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	        
	     	      </div>
	      <div class="modal-body">
	        Click to Submit Test
	        <br>
	      </div>
	      <div class="modal-footer">
	        <a type="button" href="dashboard" class="btn btn-primary" id="confirmSubmit">Submit Test</a>
	      </div>
	    </div>
	  </div>
	</div>
    <footer class="bg-blue">
        <div class="text-center">
            <span class="fff">
                <i class="far fa-copyright adjust-padd fff"></i>
                Copyright HackerCode.in 2018
            </span>
        </div>
    </footer>
   	<input style="display: none" value=${ test_id } id="test_id">
   	<input style="display: none" value=${ user_id } id="user___id">
</body>
<!-- SCRIPT FILES FOR GIVING TEST -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/give-test/take-test/js/config.js"></script>
<script src="${pageContext.request.contextPath}/resources/give-test/take-test/js/variables.js"></script>
<script src="${pageContext.request.contextPath}/resources/give-test/take-test/js/methods.js"></script>
<script>
	let btn = $("#inst-btn");
	
	 const policy = document.getElementById("policy");
	    policy.addEventListener('click', function() {
	      if(policy.checked){
	       btn.removeAttr("disabled");
	      } 
	      else {
	    	  btn.attr("disabled", "disabled");
	      }
	    });

</script>
</html>