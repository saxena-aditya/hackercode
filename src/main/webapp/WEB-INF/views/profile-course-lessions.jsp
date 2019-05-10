		<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="row">
	<div class="col-md-5">
		<div id="accordion">
		  <div class="card hc-card">
		    <div class="card-header" id="headingOne">
		      <div class="hc-acc-title d-flex justify-content-between">
		      	<h5 class="mb-0">
			        <a class="hc-indicate-alt" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
			          Collapsible Group Item #1
			        </a>
		        </h5>
		        <div class="indicate">
		        	<a href="#" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		        		<i class="fas fa-minus hc-indicator" id="id1"></i>
		        	</a>
		        </div>
		      </div>
		    </div>
		
		    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
		      <div class="card-body">
				<div class="lession-links">
					<div class="lession-title">
						<i class="far fa-file-video"></i> &nbsp;<a href="#" class="lesson-title" data-src = "https://sample-videos.com/video123/mp4/240/big_buck_bunny_240p_30mb.mp4">Lession - 1 Introduction to Recursion</a>
					</div>
					<div class="lession-title">
						<i class="far fa-file-video"></i> &nbsp;<a href="#" class="lesson-title" data-src = "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4">Lession - 2 Recursion an Art</a>
					</div>
					<div class="lession-title">
						<i class="far fa-file-pdf"></i> &nbsp;<a href="#" class="lesson-title" data-src = "http://do4k6lnx3y4m9.cloudfront.net/v/SampleVideo_1280x720_2mb.mp4">Lession - 3 Recursion Quiz</a>
					</div>
				</div>
		      </div>
		    </div>
		  </div>
		  <div class="card hc-card">
		    <div class="card-header" id="headingTwo">
		    <div class="d-flex justify-content-between hc-acc-title">
		      <h5 class="mb-0">
		        <a data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		          Collapsible Group Item #2
		        </a>
		      </h5>
		      <div class="indicate">
		      	<a href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		      		<i class="fas fa-plus hc-indicator" id="id2"></i>
		      	</a>
		      </div>
		      </div>
		    </div>
		    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
		      <div class="card-body">
		        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
		      </div>
		    </div>
		  </div>
		  <div class="card hc-card">
		    <div class="card-header" id="headingThree">
		      <div class="d-flex justify-content-between hc-acc-title">
		      <h5 class="mb-0">
		        <a data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
		          Collapsible Group Item #3
		        </a>
		      </h5>
		      <div class="indicate">
		      	<a href="#" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
		      		<i class="fas fa-plus hc-indicator" id="id3"></i>
		      	</a>
		      </div>
		      </div>
		    </div>
		    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
		      <div class="card-body">
		        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
		      </div>
		    </div>
		  </div>
		</div>
	</div>

	<div class="col-md-7 ld-over" id="video-container">	
				<div class="ld ld-ring ld-spin"></div>
	
		<video id="my-player" class="video-js" controls playsinline  controlsList="nodownload" style="width:100%">
		  <source src="" type="video/mp4">
		</video>
</div>
</div>