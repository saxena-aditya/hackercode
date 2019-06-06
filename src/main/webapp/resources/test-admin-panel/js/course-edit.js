(function() {
    let course = $("#courseData").val();
    if (course.length > 0) {
        course = JSON.parse(course);
        course = course.pop();
        console.log(course);

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
            class: "form-control ln-inp",
            placeholder: "Enter Lesson Name",
            required: "required",
            "data-code": null,
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
        e.preventDefault();
        var obj = {};
        obj.chapters = [];

        let courseContainer = $("#course-container");
        let chapters = courseContainer.find(".chapter-container");
        
        console.log(chapters);
        console.log(typeof chapters)
        
        if (chapters.length > 0) {
            chapters.each((i,chapter)=>{
                // getting chapter data
                console.log(chapter, i);
                $(".ch-inp").each(function(e) {
                    console.log(e);
                    let id = $(this)[0].id;
                    let ch = id.split("-").pop();
                    obj.chapters[ch - 1] = {
                        name: $(this).val(),
                        code: $(this).attr("data-code"),
                        lessons: []
                    }
                });
                $(".ln-inp").each(function(e) {
                    let blocks = $(this)[0].id.split("-");
                    let ln = blocks.pop();
                    let ch = blocks.pop();
                    obj.chapters[ch - 1].lessons[ln - 1] = {
                        name: $(this).val(),
                        code: $(this).attr("data-code")
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
                            code: null
                        };
                        totalSize += $(this)[0].files[0].size;
                        loaded[$(this)[0].files[0].name] = 0;
                    } else {
                        obj.chapters[chId - 1].lessons[lnId - 1].resource = {
                            code: $(this).attr("data-code"),
                            file: $(this).val()
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

        return false;
    });

    $(document).on("change", ".new-file", function(e) {
        let blocks = e.target.id.split("-");
        let lnId = blocks.pop();
        let chId = blocks.pop();

        saveFileDuration($("#f-upload-" + chId + "-" + lnId)[0].files[0]);
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
}
)();
