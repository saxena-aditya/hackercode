(function($) {
  'use strict';
  $(function() {
    var sidebar = $('.sidebar');

    //Add active class to nav-link based on url dynamically
    //Active class can be hard coded directly in html file also as required
    var current = location.pathname.split("/").slice(-1)[0].replace(/^\/|\/$/g, '');
    $('.nav li a', sidebar).each(function() {
      var $this = $(this);
      if (current === "") {
        //for root url
        if ($this.attr('href').indexOf("index.html") !== -1) {
          $(this).parents('.nav-item').last().addClass('active');
          if ($(this).parents('.sub-menu').length) {
            $(this).closest('.collapse').addClass('show');
            $(this).addClass('active');
          }
        }
      } else {
        //for other url
        if ($this.attr('href').indexOf(current) !== -1) {
          $(this).parents('.nav-item').last().addClass('active');
          if ($(this).parents('.sub-menu').length) {
            $(this).closest('.collapse').addClass('show');
            $(this).addClass('active');
          }
        }
      }
    })

    //Close other submenu in sidebar on opening any

    sidebar.on('show.bs.collapse', '.collapse', function() {
      sidebar.find('.collapse.show').collapse('hide');
    });


    //Change sidebar and content-wrapper height
    applyStyles();

    function applyStyles() {
      //Applying perfect scrollbar
      if ($('.scroll-container').length) {
        const ScrollContainer = new PerfectScrollbar('.scroll-container');
      }
    }

    //checkbox and radios
    $(".form-check label,.form-radio label").append('<i class="input-helper"></i>');


    $(".purchace-popup .popup-dismiss").on("click",function(){
      $(".purchace-popup").slideToggle();
    });
  });
  
  $(document).on("click", "a", function(event) {
	  var id = event.target.id.split("-");
	  if (id[0] === "question" && id[1] === "get") {
		  var testId = id[2];
		  var preActiveId = 0;
		  $.ajax({
			  type: 'GET',
			  url: 'get-questions-for-test/' + testId,
			  beforeSend: function() {
				 
				  $("tr").each(function(){
					  console.log($(this));
					   if ($(this)[0].id === ("label-"+testId)) {
						   $(this).addClass("table-success");
					   }
					   else {
						   if ($(this).hasClass("table-success")) {
							   $(this).removeClass("table-success");
						   }
					   }
				  });
				 
			  },
			  success: function(data) {
				  console.log(data);
				  var str = "";
				  data.forEach(function(val, i) {
					  str += "<tr><td>"+val.questionContent.substring(0, 45)+"..."+"</td>"+
					  "<td>"+val.questionSet+"</td></tr>";
				  })
				  $("#test-questions").html(str);
				  
			  },
			  error: function(a,b,c) {
				  alert('error');
			  }
		  })
	  }
	  
  })
})(jQuery);