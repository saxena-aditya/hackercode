const prod_test_history = "/get-completed-tests";
const prod_test_all = "/get-live-tests";

const dev_test_history = "/WebHackerCode/get-completed-tests";
const dev_test_all = "/WebHackerCode/get-live-tests";

function getCompletedTests() {
	const breadstep = "Test History";
	$.ajax({
		type: "GET",
		url: dev_test_history,
		beforeSend: function() {
			$("#status-arr").addClass("running");
		},
		success: function(data) {
			$("#content").html(data);
			$("#status-arr").removeClass("running");
		},
		error: function() {
			alert("error");
		}
	});
}

function getLiveTests() {
	const breadStep = "Tests";
	$.ajax({
		type: "GET",
		url: dev_test_all,
		beforeSend: function() {
			$("#status-arr").addClass("running");
		},
		success: function(data) {
			$("#content").html(data);
			$("#status-arr").removeClass("running");			
		},
		error: function(a,b,c) {
			alert("error");
		}
	});
}

(function() {
	
	const sideNavHandles = ['my-reports', 'my-exams'];
	const sideNavEvents = ['getCompletedTests', 'getLiveTests'];
	$("a").on("click", function(e) {
		if (sideNavHandles.includes(e.target.id)) {
			let index = sideNavHandles.indexOf(e.target.id);
			let exec = sideNavEvents[index];
			console.log(exec);
			window[exec]();
		}
	});
})();