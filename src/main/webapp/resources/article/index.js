(function() {
	
	let articleHeight = $(".article-col").outerHeight();
	let footerHeight = $("footer").outerHeight()/2;
	let windowHeight = $(window).outerHeight();
	console.log("article: ", articleHeight);
	console.log("footer: ", footerHeight);
	console.log("window: ", $(window).outerHeight());
	$.fn.isInViewport = function() {
	    var elementTop = $(this).offset().top;
	    var elementBottom = elementTop + $(this).outerHeight();

	    var viewportTop = $(window).scrollTop();
	    var viewportBottom = viewportTop + $(window).height();

	    return elementBottom > viewportTop && elementTop < viewportBottom;
	};
	
    $(window).scroll(function () {
        console.log($(this).scrollTop(), (120 + articleHeight-windowHeight+footerHeight));
        if ($(this).scrollTop() > 120 ) {
            $('.dd').addClass('fix')
        }
        else {
        	$('.dd').removeClass("fix");
        }
        
        if ($('footer').isInViewport()) {
        	$('.dd').removeClass("fix");

        }
    });


	
	let tags = $("#h-tags").val();
	let colors = ['none','bg-red', 'bg-green', 'bg-purple', 'bg-orange', 'bg-blue'];
	if (tags.length > 0) {
		let tagsArr = tags.split(",");
		tagsArr.forEach((tag) => {
			let span = $("<span>", {
				class: "tag " + colors[Math.floor(Math.random() * (colors.length-1)) + 1 ],
			}).appendTo($(".tags"));
			span.text(tag);
		});
	}
	
	let nav = $("#nav").val();
	console.log(nav);
	if (nav.length > 0) {
		nav = JSON.parse(nav);
		console.log(nav);
		nav.forEach((cat) => {
			let li = $("<li>", {
				class: "nav-item dropdown"
			}).appendTo($("#categories"));
			
			let a = $("<a>", {
				class: "nav-link dropdown-toggle",
				//href: "articles/" + cat.value,
				id: cat.value,
				"data-toggle":"dropdown",
                "aria-haspopup": "true",
                "aria-expanded": "false"
			}).appendTo(li);
			a.text(cat.name);
			
			let div = $("<div>", {
				 class: "dropdown-menu dropdown-menu-right",
				 "aria-labelledby": cat.value + "-" + cat.name
			}).appendTo(li);
			
			if (cat.sub_category.length > 0) {
				cat.sub_category.forEach((sub_cat) => {
					let a = $("<a>", {
						class: "dropdown-item",
						href: "/articles/" + cat.value + "/" + sub_cat.value
					}).appendTo(div);
					a.text(sub_cat.name);
				})
			}
			
			
		});
	}
})();