(function() {
 player = new Plyr('.plyr', {
		controls: [
		    'play-large', // The large play button in the center
		    'restart', // Restart playback
		    'rewind', // Rewind by the seek time (default 10 seconds)
		    'play', // Play/pause playback
		    'fast-forward', // Fast forward by the seek time (default 10 seconds)
		    'progress', // The progress bar and scrubber for playback and buffering
		    'current-time', // The current time of playback
		    'duration', // The full duration of the media
		    'mute', // Toggle mute
		    'volume', // Volume control
		    'captions', // Toggle captions
		    'settings', // Settings menu
		    'pip', // Picture-in-picture (currently Safari only)
		    'airplay', // Airplay (currently Safari only)
		    
		    'fullscreen', // Toggle fullscreen
		]

	});
 function sticky_relocate() {
	  var window_top = $(window).scrollTop();
	  var div_top = $('#sticky-anchor').offset().top;
	  if (window_top > div_top) {
	    $('#sticky').addClass('stick');
	  } else {
	    $('#sticky').removeClass('stick');
	  }
	}

	
  $(window).scroll(sticky_relocate);
  sticky_relocate();
  
	$("#order").on('click', function() {
		$("#paytm-submit").click();
	})
	const prod_get_lession = "/get-course-lessions";
	const dev_get_lession = "/WebHackerCode/get-course-lessions";
	console.log("path", $("#path").html());
	let totalLessons = 0;
	$.ajax({
		
		type: "POST",
		url: "/WebHackerCode/get-course-lessions",
		data: {code: $('#code').html()},
		beforeSend: function() {
			console.log('sending data...');
			$("#status-arr").addClass("running");
			$("#course-type--bar").addClass("running");
		},
		success: function(data) {
			data = JSON.parse(data);
			data = data[0];
			let chapterHTML = '',
				lessonHTML = '',
				op = '';
				console.log(data);
			data.chapters.forEach(function(chapter, i) {
				chapterHTML += '<li class="container tree-leaf"><p>'+ chapter.name +'</p>';
				chapter.lessons.forEach(function(lesson, j) {
					lessonHTML += '<li class="tree-leaf"><p class="tree-r d-flex justify-content-between"><span><i class="far fa-play-circle"></i>'+ lesson.name +'</span><span>8~12 mins</span></p></li>';
					totalLessons++;
				});
				
				//lessonHTML += '<ul class="tree">' + lessonHTML + '</ul>';
				op += chapterHTML + '<ul class="tree">' + lessonHTML + '</ul></li>';
				lessonHTML = chapterHTML = '';
			});
			
			$("#lesson-tree").html(op);
			$("#lec-num").html(totalLessons);
			$("#top-lec-num").html(totalLessons);
			$("#lec-hrs").html(totalLessons*8 + "~"+ totalLessons*12);
			$("#course-desc").append($("#course-desc-h").text() );
			console.log($("#course-desc-h").text());
			console.log("led", totalLessons);
			$("#status-arr").removeClass("running");
			$("#course-type--bar").removeClass("running");


		},
		error: function() {
			console.log('error');
		}
		
	})
	
})();