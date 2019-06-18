$(function () {

    $(".a-tags").select2({
        tags: true,
        tokenSeparators: [',']
    });
    $('#summernote').summernote({
       height: 300,
        codemirror: { // code mirror options
            theme: 'monokai'
        }
    });
    
    
    
    // get sub-categories when a category is selected.
    $("#cat").on("change", function(e) {
    	$.ajax({
    		method: "POST",
    		url: "/user/drafter/api/get-sub-category",
    		data: {categoryCode: e.target.value},
    		beforeSend: function() {
    			console.log("Sending");
    		},
    		success: function(data){
    			if (data) {
    				let categories = JSON.parse(data);
    				console.log(categories);
    				
    				let subCatContainer = $("#sub-cat");
    				subCatContainer.html("");
    				categories.forEach((cat) => {
    					let option =  $("<option>", {
    						value: cat.id
    					}).appendTo(subCatContainer);
    					option.text(cat.name);
    				});
    			}
    			else {
    				console.log("incorrect result returned");
    			}
    		},
    		error: function(a, xhr, c) {
    			console.log("Error Occured!");
    		}
    	});
    });
    
    // handle article submission
    $(document).on("click", ".sub-article", function(e) {
    	let article = {};
    	article.title = $(".a-title").val();
    	article.tags = $(".a-tags").val();
    	article.categoryCode = $(".a-cat").val();
    	article.subCategoryCode = $(".a-sub-cat").val();
    	article.content = $('#summernote').summernote('code');
    
    	let error = false;
    	let btnText = $(".sub-article").html();
    	console.log(btnText);
    	
    	Object.keys(article).forEach(e => {
    		if (!article[e] || article[e].length == 0) error = true;
    	});
    	
    	if (error){
    		alert ("Error!");
    	}
    	else {
    		$.ajax({
    			method: "POST",
    			url: "/user/drafter/api/save-article",
    			data: {
    				title: article.title,
    				tags: article.tags.join(","),
    				categoryCode: article.categoryCode,
    				subCategoryCode:article.subCategoryCode,
    				content: article.content
    			},
    			beforeSend: function() {
    				
    				$(".sub-article").text("Saving...");
    			},
    			success: function(data) {
    				let article = JSON.parse(data);
    				console.log(article);
    				if (article.error) {
    					iziToast.error({
    					    title: 'Error',
    					    message: article.error_text,
    					});

    				}
    				else {
    					iziToast.success({
    					    title: 'Drafted',
    					    message: 'Successfully Drafted Article',
    					});

    				}
    				$(".sub-article").html(btnText);

    			},
    			error: function(a,xhr,b) {
    				console.log(a, xhr,b);
    			}
    		})
    	}


    });
});