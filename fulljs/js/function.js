$(document).ready(function(){
 $('#fullpage').fullpage({
    sectionsColor: ['#F78888','#F3D250','#479761','#5DA2D5'],
    easingcss3: 'cubic-bezier(0.175,0.885,0.320,1.275)',
    looptop: true,
    loopbottom:true,
    navigation:true,
    navigationPosition:'right',
    navigationTooltips: ['Section1','Section2','Section3',],
    
    afterLoad: function(anchorlink, index, direction){
        if(index==2){
            console.log('Enter');
    }
    },
    onLeave: function(anchorlink, index, direction){
        if(index==2){
            console.log('Quit');
    }
    },
});
});