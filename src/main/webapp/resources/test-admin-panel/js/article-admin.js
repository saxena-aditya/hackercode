(function() {
	$(document).on("click", ".s-btn", function(e) {
		console.log(e);
		let articleId = $(this)[0].id.split("-").pop();
		
		//<i class="fas fa-times-circle"></i>
		if ($(this).hasClass("approve")) {
			console.log("approve");
			$.ajax({
				method: "POST",
				url: "/admin/articles/api/approve",
				data: {id: articleId},
				beforeSend: function() {
					console.log("Approving Articel ID: " + articleId);
				},
				success: function(data) {
					if (data) {
						
						$("#status-" + articleId).removeClass("fa-check-circle");
						$("#status-" + articleId).addClass("fa-times-circle")
						$("#article-" + articleId).removeClass("btn-success");
						$("#article-" + articleId).addClass("btn-danger");
						$("#article-" + articleId).removeClass("approve");
						$("#article-" + articleId).addClass("disapprove");
						
					}
				},
				error: function(a, xhr, b) {
					console.log(a, xhr, b);
				}
			});
		}
		else if ($(this).hasClass("disapprove")) {
			console.log("disapprove");
			$.ajax({
				method: "POST",
				url: "/admin/articles/api/disapprove",
				data: {id: articleId},
				beforeSend: function() {
					console.log("Approving Articel ID: " + articleId);
				},
				success: function(data) {
					$("#status-" + articleId).removeClass("fa-times-circle");
					$("#status-" + articleId).addClass("fa-check-circle")
					$("#article-" + articleId).removeClass("btn-danger");
					$("#article-" + articleId).addClass("btn-success");
					$("#article-" + articleId).removeClass("disapprove");
					$("#article-" + articleId).addClass("approve");
				},
				error: function(a, xhr, b) {
					console.log(a, xhr, b);
				}
			});
		}
	})
})();