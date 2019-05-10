(function() {
var objectToFormData = function(obj, form, namespace) {
    
	  var fd = form || new FormData();
	  var formKey;
	  
	  for(var property in obj) {
	    if(obj.hasOwnProperty(property)) {
	      
	      if(namespace) {
	        formKey = namespace + '[' + property + ']';
      } else {
        formKey = property;
      }
     
      // if the property is an object, but not a File,
      // use recursivity.
      if(typeof obj[property] === 'object' && !(obj[property] instanceof File)) {
        
        objectToFormData(obj[property], fd, property);
        
      } else {
        
        // if it's a string or a File object
        fd.append(formKey, obj[property]);
      }
      
    }
  }
  return fd;
    
};
	  
$(document).on("click", ".save-course", function(e) {
	let obj = {};
	obj.course_name = $("#c-title").val();
	obj.course_desc = $("#c-desc").val();
	obj.days = $("#d-days").val();
	obj.price = $("#p-price").val();
	obj.chapters = [];
	$(".ch-inp").each(function(e) {
		let chId = $(this)[0].id.split("-").pop();
		obj.chapters[chId - 1] = {title: $(this).val(), lessons: []};
	})

	$(".ln-inp").each(function(e){
		let blocks = $(this)[0].id.split("-");
		let lnId = blocks.pop();
		let chId = blocks.pop();
		obj.chapters[chId-1].lessons[lnId-1] = {name: $(this).val(), resources: []};
	});
	let fd = new FormData();
	let i = 0;
	$(".r-inp").each(function(e) {
		let blocks = $(this)[0].id.split("-");
		let rId = blocks.pop();
		let lnId = blocks.pop();
		let chId = blocks.pop();
		fd.append("files[" + i++ + "]", $(this)[0].files[0]);
		
		obj.chapters[chId-1].lessons[lnId-1].resources[rId - 1] = $(this)[0].files[0];
	});
	
	let course = obj.course_name;
	let desc = obj.course_desc;
	let price = obj.price;
	let days = obj.days;
	obj.chapters.forEach(function(chapter){
		let chName = chapter.title;
		chapter.lessons.forEach(function(lesson) {
			let fd = new FormData();
			fd.append('name', course);
			fd.append('desc', desc);
			fd.append('price', price);
			fd.append('totalDays', days);
			fd.append('chapter', chName);
			fd.append('lesson', lesson.name);
			let i = 0;
			lesson.resources.forEach(function(resource) {
				fd.append('files[' + i++ + ']', resource);
			});
			
			$.ajax({
				type: "POST",
				url: "/WebHackerCode/upload-course",
				data: fd,
				contentType: false,
			    processData: false,
			    async: false,
			    beforeSend: function() {
			    	console.log("seding data...");
			    },
			    success: function(data) {
			    	console.log(data);
			    },
			    error: function(a,c,b) {
			    	alert("error");
			    }
			});
		});
	});
	console.log(obj);
	/*let formData = objectToFormData(obj);
	for(var pair of formData.entries()) {
		   console.log(pair[0], pair[1]); 
	}*/
	
	

})
let formData = objectToFormData({
	name: 'Aditya Saxnea',
	date: {
		day: "29",
		month: "Apr",
		year: "1998",
		kds: [
			"Aditya",
			 "19"
		]
	}
})
  for(var pair of formData.entries()) {
	   console.log(pair[0], pair[1]); 
}
 function getChapterHTML(num) {
	    return '<div class="course-chapter" id="chapter-'+ num +'">\
	      <div class="title">\
		    <div class="row">\
				<div class="col-md-1 trash-bin">\
					<i class="far fa-trash-alt ch-del-btn" id="delete-chapter-'+ num +'"></i>\
				</div>\
				<div class="col-md-11">\
					<label for="">Chapter Title</label>\
					<input type="text" id="ch-title-'+ num +'" class="form-control ch-inp" placeholder="What is Python..." name="chapterTitle[]" /></div>\
			</div>\
	      </div>\
	    <div class="body" id="chapter-body-'+ num +'"></div>';
 } 
 
 function getLessonHTML(chapter, lesson) {
	 return '<div class="lesson-title" id="lesson-'+ chapter +'-'+ lesson +'">\
				<div class="row">\
				 <div class="col-md-1 trash-bin">\
					<i class="far fa-trash-alt ln-del-btn" id="delete-lesson-'+ chapter +'-'+ lesson +'"></i>\
				</div>\
				<div class="col-md-10">\
					<label for="">lesson Name</label>\
					<input type="text" id="ln-title-'+ chapter +'-'+ lesson +'" class="form-control ln-inp" placeholder="What is Python..." name="lessonTitle[]" />\
				</div>\
				<div class="col-md-1">\
					<i class="fas fa-plus-circle add-resource" id="add-r-'+ chapter +'-'+ lesson +'"></i>\
		         </span></div></div></div></div>';
 }
 
 function getResourceHTML(chapter, lesson, res) {
	 
	 return '<div class="row r" id="r-'+ chapter +'-'+ lesson +'-'+res+'">\
	 <div class="col-md-1 trash-bin">\
		<i class="far fa-trash-alt r-del-btn" id="delete-r-'+ chapter +'-'+ lesson +'-'+res +'"></i>\
	 </div>\
	 <div class="col-md-11">\
	 <label for="">lesson Source</label>\
		<div class="input-group col-xs-12">\
	     <input type="file" class="form-control file-upload-r r-inp" id="f-upload-'+ chapter +'-'+ lesson +'-'+res +'" placeholder="Upload Image">\
     <input type="text" class="form-control file-upload-info" id="f-name-'+ chapter +'-'+ lesson +'-'+res +'" placeholder="Upload Image">\
     <span class="input-group-append">\
       <button class="file-upload-browse btn btn-info" id="f-upload-'+ chapter +'-'+ lesson +'-'+res +'" type="button">Upload</button>\
     </span>\
	</div></div></div>';
 }
	  
  let chapterNum = 0;
  let lessonNum = 0;
  
  let pChapter = 0;
  let plesson = 0;
  let pRes = 0;
  let chapterContainer = $("#chapter-container");
  let lnBtn = $("#ls-add");
  let chBtn = $("#ch-add");
  lnBtn.attr("disabled", "disabled");
  
  chBtn.on("click", function() {
    chapterNum++; pChapter = chapterNum;
    pLesson = 0;
    chapterContainer.append(getChapterHTML(chapterNum));
    
    lnBtn.removeAttr("disabled");
    
    if (plesson == 0) {
    	$("#ch-add").attr("disabled", "disabled");
    }
    else {
    	$("#ch-add").removeAttr("disabled");
    }
  });
  
  lnBtn.on("click", function() {
	  lessonNum++; pLesson++;
	  $("#chapter-body-" + pChapter).append(getLessonHTML(pChapter, pLesson));
	  
	  if (pLesson > 0) {
		  chBtn.removeAttr("disabled");
	  }
  });
  
  $(document).on("click", ".ln-del-btn", function(e) {
	  let blocks  = e.target.id.split("-");
	  var lnId = blocks.pop();
	  var chId = blocks.pop(); 
	  //alert(lnId + " - " + chId);
	  iziToast.question({
		    timeout: 20000,
		    close: false,
		    overlay: true,
		    displayMode: 'once',
		    id: 'question',
		    zindex: 999,
		    title: '',
		    message: '<b>Delete Lesson <i class="fas fa-question"></i></b>',
		    position: 'center',
		    buttons: [
		        ['<button><b>YES</b></button>', function (instance, toast) {
		        	$("#lesson-"+chId+"-"+lnId).remove();
		            instance.hide({ transitionOut: 'fadeOut' }, toast, 'button');
		 
		        }, true],
		        ['<button>NO</button>', function (instance, toast) {
		 
		            instance.hide({ transitionOut: 'fadeOut' }, toast, 'button');
		 
		        }],
		    ],
		    onClosing: function(instance, toast, closedBy){
		        console.info('Closing | closedBy: ' + closedBy);
		    },
		    onClosed: function(instance, toast, closedBy){
		        console.info('Closed | closedBy: ' + closedBy);
		    }
		});
	  //alert("#lesson-"+chId+"-"+lnId);
  });
  
  $(document).on("click", ".ch-del-btn", function(e) {
	  let blocks  = e.target.id.split("-");
	  var chId = blocks.pop(); 
	  //alert(lnId + " - " + chId);
	  iziToast.question({
		    timeout: 20000,
		    close: false,
		    overlay: true,
		    displayMode: 'once',
		    id: 'question',
		    zindex: 999,
		    title: '',
		    message: '<b>Do you really want to delete this chapter <i class="fas fa-question"></i></b>',
		    position: 'center',
		    buttons: [
		        ['<button><b>YES</b></button>', function (instance, toast) {
		        	$("#chapter-"+chId).remove();
		            instance.hide({ transitionOut: 'fadeOut' }, toast, 'button');
		 
		        }, true],
		        ['<button>NO</button>', function (instance, toast) {
		 
		            instance.hide({ transitionOut: 'fadeOut' }, toast, 'button');
		 
		        }],
		    ],
		    onClosing: function(instance, toast, closedBy){
		        console.info('Closing | closedBy: ' + closedBy);
		    },
		    onClosed: function(instance, toast, closedBy){
		        console.info('Closed | closedBy: ' + closedBy);
		    }
		});
	  //alert("#lesson-"+chId+"-"+lnId);
  })
  
  $(document).on("click", ".add-resource", function(e) {
	  pRes++;
	  let blocks = e.target.id.split("-");
	  let lsId = blocks.pop();
	  let chId = blocks.pop();
	  
	  $("#lesson-" + chId +"-" +lsId).append(getResourceHTML(pChapter, pLesson, pRes));
  });
  
  $(document).on("click", ".r-del-btn", function(e) {
	  let blocks = e.target.id.split("-");
	  let rId = blocks.pop();
	  let lnId = blocks.pop();
	  let chId = blocks.pop();
	  
	  iziToast.question({
		    timeout: 20000,
		    close: false,
		    overlay: true,
		    displayMode: 'once',
		    id: 'question',
		    zindex: 999,
		    title: '',
		    message: '<b>Delete Lesson Resource <i class="fas fa-question"></i></b>',
		    position: 'center',
		    buttons: [
		        ['<button><b>YES</b></button>', function (instance, toast) {
		        	$("#r-"+chId + "-" + lnId + "-" + rId).remove();
		            instance.hide({ transitionOut: 'fadeOut' }, toast, 'button');
		 
		        }, true],
		        ['<button>NO</button>', function (instance, toast) {
		 
		            instance.hide({ transitionOut: 'fadeOut' }, toast, 'button');
		 
		        }],
		    ],
		    onClosing: function(instance, toast, closedBy){
		        console.info('Closing | closedBy: ' + closedBy);
		    },
		    onClosed: function(instance, toast, closedBy){
		        console.info('Closed | closedBy: ' + closedBy);
		    }
		});
	  
  })
$(document).on("click", ".file-upload-browse", function(e) {
	let blocks = e.target.id.split("-");
	let rId = blocks.pop();
	let lnId = blocks.pop();
	let chId = blocks.pop();
	
	$("#f-upload-" +chId + "-" + lnId + "-" + rId ).click();
	$(document).on("change", "#f-upload-" +chId + "-" + lnId + "-" + rId, function(e){
		let name = $("#f-upload-" +chId + "-" + lnId + "-" + rId).val().split("\\").pop();
		$("#f-name-" +chId + "-" + lnId + "-" + rId).val(name);
	} )
});
	  
})();