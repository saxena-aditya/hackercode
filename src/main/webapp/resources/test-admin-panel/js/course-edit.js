(function() {
	
	var albumBucketName = "hcvideo212";
	  var bucketRegion = "us-east-1";
	  var IdentityPoolId = "us-east-1:bd02edbc-3f46-4c0e-9ebe-ea8f4f80c8b3";

	  AWS.config.update({
	    credentials: new AWS.CognitoIdentityCredentials({
	      IdentityPoolId: IdentityPoolId
	    })
	  });
	  AWS.config.region = "us-east-1";

	  var s3 = new AWS.S3({
	    apiVersion: "2006-03-01",
	    params: {
	      Bucket: albumBucketName
	    }
	  });
	  var totalSize = 0;
	  var loaded = [];
	  
	  
	  
    let course = $("#courseData").val();
    if (course.length > 0) {
        course = JSON.parse(course);
        course = course.pop();
        console.log(course);
        
        var addChapterBtn = $("<button>", {
            class: "btn btn-default new-ch",
            id: "new-ch",
        }).appendTo($("#course-container"));
        addChapterBtn.text("New Chapter");
        
        course.chapters.forEach((chapter,i)=>{
            var x = i + 1;
            var chapterDiv = $("<div>", {
                class: "chapter-container",
                id: "ch-" + x
            }).appendTo($("#course-container"));
            
            

            var chapterInput = $("<input>", {
                type: "text",
                class: "form-control ch-inp",
                value: chapter.name,
                "data-code": chapter.code,
                required: "required",
                id: "ch-inp-" + x
            }).appendTo(chapterDiv);
            
            var addLessonBtn = $("<button>", {
                class: "btn btn-default new-ln",
                id: "new-ln-" + x,
            }).appendTo(chapterDiv);
            addLessonBtn.text("New Lesson");

            chapter.lessons.forEach((lesson,j)=>{
                var y = j + 1;
                var lessonDiv = $("<div>", {
                    class: "lesson-container",
                    id: "ln-" + x + "-" + y
                }).appendTo(chapterDiv);

                var lessonInput = $("<input>", {
                    type: "text",
                    class: "form-control ln-inp",
                    value: lesson.name,
                    "data-code": lesson.code,
                    required: "required",
                    id: "ls-name-" + x + "-" + y
                }).appendTo(lessonDiv);

                var lessonFile = $("<input>", {
                    type: "text",
                    class: "form-control r-inp old-file",
                    value: lesson.resourse,
                    "data-code": lesson.code,
                    required: "required",
                    id: "rs-name-" + x + "-" + y
                }).appendTo(lessonDiv);
            }
            );
        }
        );
    }
    
    $(document).on("click", ".new-ch", function(e) {
    	e.preventDefault();
    	console.log('adding new chapter');
    	let chaptersAlreadyPresent = $("#course-container").find(".chapter-container").length;
    	let newChapterDiv = $("<div>", {
             class: "chapter-container",
             id: "ch-" + (chaptersAlreadyPresent + 1),
         }).appendTo($("#course-container"));
    	
    	var chapterInput = $("<input>", {
            type: "text",
            class: "form-control ch-inp new-ch-inp",
            placeholder: "Enter Chapter Name",
            "data-code": makeID(6),
            required: "required",
            id: "ch-inp-" + (chaptersAlreadyPresent + 1)
        }).appendTo(newChapterDiv);
        
        var addLessonBtn = $("<button>", {
            class: "btn btn-default new-ln",
            id: "new-ln-" + (chaptersAlreadyPresent + 1),
        }).appendTo(newChapterDiv);
        addLessonBtn.text("New Lesson");
        
    });

    $(document).on("click", ".new-ln", function(e) {
        e.preventDefault();
        console.log(e.target.id);
        let ch = e.target.id.split("-").pop();
        let chapterDiv = $("#ch-" + ch);
        let lessonNum = chapterDiv.find(".lesson-container").length;

        var lessonDiv = $("<div>", {
            class: "lesson-container",
            id: "ln-" + ch + "-" + (lessonNum + 1)
        }).appendTo(chapterDiv);

        var lessonInput = $("<input>", {
            type: "text",
            class: "form-control ln-inp new-ln-inp",
            placeholder: "Enter Lesson Name",
            required: "required",
            "data-code": makeID(7),
            id: "ls-name-" + ch + "-" + (lessonNum + 1)
        }).appendTo(lessonDiv);

        var lessonFile = $("<input>", {
            type: "file",
            class: "form-control r-inp new-file",
            required: "required",
            "data-code": null,
            id: "f-upload-" + ch + "-" + (lessonNum + 1)
        }).appendTo(lessonDiv);

    });

    $(document).on("click", "#save-course", function(e) {
    	console.log("duration" , duration);
        e.preventDefault();
        var obj = {};
        obj.chapters = [];
        obj.name = course.name;
        obj.code = course.code;
        obj.total_days = course.total_days;
        obj.price = course.price;
        
        let courseContainer = $("#course-container");
        let chapters = courseContainer.find(".chapter-container");
        
        console.log(chapters);
        console.log(typeof chapters)
        
        if (chapters.length > 0) {
            chapters.each((i,chapter)=> {
                // getting chapter data
                console.log(chapter, i);
                $(".ch-inp").each(function(e) {
                    console.log(e);
                    let id = $(this)[0].id;
                    let ch = id.split("-").pop();
                    obj.chapters[ch - 1] = {
                        name: $(this).val(),
                        code: $(this).attr("data-code"),
                        delete: false,
                        lessons: [],
                        isNew: $(this).hasClass("new-ch-inp")?true:false
                    }
                });
                $(".ln-inp").each(function(e) {
                    let blocks = $(this)[0].id.split("-");
                    let ln = blocks.pop();
                    let ch = blocks.pop();
                    obj.chapters[ch - 1].lessons[ln - 1] = {
                        name: $(this).val(),
                        code: $(this).attr("data-code"),
                        delete: false,
                        isNew: $(this).hasClass("new-ln-inp")?true:false
                    };
                });

                $(".r-inp").each(function(e) {
                    let blocks = $(this)[0].id.split("-");
                    let lnId = blocks.pop();
                    let chId = blocks.pop();

                    if ($(this).hasClass("new-file")) {
                        let fileKey = Date.now() + "_" + $(this)[0].files[0].name.replace(/\s/g, "-");
                        obj.chapters[chId - 1].lessons[lnId - 1].resource = {
                            file: $(this)[0].files[0],
                            key: fileKey,
                            duration: duration[$(this)[0].files[0].name],
                            code: null,
                            delete: false,
                            isNew: $(this).hasClass("new-file")?true:false
                        };
                        totalSize += $(this)[0].files[0].size;
                        loaded[$(this)[0].files[0].name] = 0;
                    } else {
                        obj.chapters[chId - 1].lessons[lnId - 1].resource = {
                            code: $(this).attr("data-code"),
                            file: $(this).val(),
                            delete: false,
                            isNew: $(this).hasClass("new-ch-inp")?true:false
                        };
                    }
                });
                window.chapter = chapter;
            })
        }
        console.log(obj);

        
        // step by step process to update the course.
        // each section will have a attr named 'code' 
        // if code is null/undefined then it is a new section i.e insert it.
        // id code in a value then update that section with the new value.
        
        // init update process
        
        // save chapters
        let chaptersToSave = obj.chapters;
        var courseCode = obj.code; // course code
        chaptersToSave.forEach((chapter) => {
        	
        	// first save other rudementary course details also.
        	// { code here }
        	
        	var chCode = chapter.code; // chapter code
        	console.log("chCode", chCode, chapter);
        	var isUpdateMe = true;
        	if (!chapter.delete) {
        		// is chCode (chapter code) is null then insert record instead of updating.
    			console.log("is IF", chCode);

        		if (chapter.isNew) {
        			console.log("is IF", chCode);
        			isUpdateMe = false;
        		}
        		
        		// send update req.
        		// params: course code, code, name, isUpdate;
        		console.log("isUpdate" ,isUpdateMe, chCode);
        		$.ajax({
        			method: "POST",
        			url: "/admin/course/update/chapter",
        			data: {courseCode: courseCode, code: chCode, update: isUpdateMe, name: chapter.name },
        			beforeSend: function() {
        				console.log('sending req.', isUpdateMe);
        			},
        			success: function(data) {
        				if (data) {
        					console.log('chapter saved !!!!!!!!!!!!!!!!!!!!', chapter, courseCode);
        					// save lesson and files
        					let lessons = chapter.lessons;
        					lessons.forEach((lesson) => {
        						//params: course code, chapter code, lessons code, file name, lesson name
        						
        						// upload file if resource code is null;
        						
        						console.log("LESSON", lesson, lesson.resource.code);
        						if (lesson.resource.code == null) {
        							// upload file
        							uploadFile(lesson, courseCode, chCode)
        								// file upload success.
        								// save resource and lesson to DB

        							}
        							else {
        								// update lesson and file 
        								$.ajax({
        									method: "POST",
        									url: "/admin/course/update/lesson",
        									data: {
        										courseCode: courseCode, 
        										chapterCode: chCode, 
        										code: lesson.code, 
        										name: lesson.name,
        										update: true,
        										fileUrl: lesson.resource.file
        									},
        									beforeSend: function() {
        										console.log('saving lesson');
        									},
        									success: function(data) {
        										if (data) {
        											console.log('saved lesson');
        										}
        										else {
        											console.log('not saved');
        										}
        									},
        									error: function() {
        										console.log('error serious');
        									}
        								})
        							}
        						});
        						
        				
        				}
        				else console.log('error occured');
        				
        				// init lessons and resources here.
        			},
        			error: function(a, xhr, c) {
        				console.log('some serious error occured!');
        			}
 
        	 	});
        		
        		// if success. send lessons with their resource file. 
        	}
        	else {
        		// marks chapter to be inactive.
        		console.log('delete');
        	}
        	
        })
        return false;
    });

    $(document).on("change", ".new-file", function(e) {
        let blocks = e.target.id.split("-");
        let lnId = blocks.pop();
        let chId = blocks.pop();

        saveFileDuration($(this)[0].files[0]);
    });

    var duration = [];
    window.URL = window.URL || window.webkitURL;
    var totalSize = 0;
    var loaded = [];
    function saveFileDuration(file) {
        var video = document.createElement("video");
        video.preload = "metadata";

        video.onloadedmetadata = function() {
            window.URL.revokeObjectURL(video.src);
            duration[file.name] = Math.floor(video.duration);
        };
        
        video.src = URL.createObjectURL(file);
    }
    
    function makeID(length) {
	   var result           = '';
	   var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
	   var charactersLength = characters.length;
	   for ( var i = 0; i < length; i++ ) {
	      result += characters.charAt(Math.floor(Math.random() * charactersLength));
	   }
	   return '+' + result;
    }

    function uploadFile(rs, courseCode, chCode) {
    /*    $(".save-course").attr("disabled", "disabled");
    */    const options = {
          partSize: 5 * 1024 * 1024,
          queueSize: 1
        };

        //var fileKey = dir +  Date.now() + "_" + fileName;
        s3.upload(
          {
            Key: rs.resource.key,
            Body: rs.resource.file,
            ContentType: rs.resource.file.type,
            ACL: "public-read"
          },
          options
        )
          .on("httpUploadProgress", function(evt) {
            var loadedTotal = 0;
            loaded[this.body.name] = evt.loaded;
            for (var j in loaded) {
              loadedTotal += loaded[j];
            }

            console.log(loaded);

            var xx = Math.round((loadedTotal / totalSize) * 100);
            let totalSizeInMBs = (totalSize / (1024 * 1024)).toFixed(2);
            let totalLoadedInMBs = (loadedTotal / (1024 * 1024)).toFixed(2);

            /*$(".progress-container").show();
            $("#bar-progress").attr("style", "width: " + xx + "%");
            $("#percent-progress").html(xx);
            $("#status").html(
              'Uploaded: <span id="done-mb">' +
                totalLoadedInMBs +
                "</span> of <span id='total-mb'>" +
                totalSizeInMBs +
                "</span> <span id='per'></span>(" +
                xx +
                "%)</span>"
            );*/
            if (loadedTotal === totalSize) {
            	return true;
            }
          })

          .send(function(err, data) {
            if (!err) {
              console.log("done");
              $.ajax({
					method: "POST",
					url: "/admin/course/update/lesson",
					data: {
						courseCode: courseCode, 
						chapterCode: chCode, 
						code: rs.code, 
						name: rs.name,
						update: false,
						duration: duration[rs.resource.file.name],
						fileUrl: rs.resource.key
					},
					beforeSend: function() {
						console.log('saving lesson');
					},
					success: function(data) {
						if (data) {
							console.log('saved lesson');
						}
						else {
							console.log('not saved');
						}
					},
					error: function() {
						console.log('error serious');
					}
				});
              
            } else {
              console.log(err);
            }
          });

      }

}


)();


