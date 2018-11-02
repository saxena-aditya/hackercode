$(document).ready(function () {

     $('#sidebarCollapse').on('click', function (e) {
        $('#sidebar').toggleClass('active');
        $(this).toggleClass('active');
    });

     $('#test-1').on('click', function(e) {
     	window.open('../take-test/index.html', 'Take Test', 'type=fullWindow, fullscreen, scrollbars=yes');
     })

});