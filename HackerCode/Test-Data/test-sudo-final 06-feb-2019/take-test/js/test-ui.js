


(function () {
    /* function for getting test data */
    $.get('http://localhost:3000/', function (data, status) {
        console.log(data);
        const test = { ...data };
        test_store={...data}
        console.log(test)
        if (data == 0)
            return;//if test was not received here

        /* result will hold the keys of the object now we can acces each object */
        let result = Object.keys((test.question_set));
        console.log(result);
        /* decleraing a variable count so that we can access the question set wise */
        let count = 0;

        result.map((key) => {
            console.log("key : ",key);
            /*-----for top of nav bar type adding sets to a array */
            sets_for_types_of_question.push(`<div class="tag bg-blue-light" id=${key}><p class="margin-0 tag-text fff">${key}</p></div>`);

            const temp_button=[];
            //sideview_question_status.push(`<h5 class="set">${key}</h5>`);
            test.question_set[key].questions.map((question, index) => {
                myQuestions.push({
                    id : index,
                    question: question.question,
                    answers: question.options
                })
                //console.log(count);
    
                marks_of_each_question.push(question.marks);
                negative_of_each_question.push(question.negative);

                temp_button.push(`<button class="classic-btn normal" id="${count++}" value=${index + 1}>${index + 1}</button>`);
                //sideview_question_slide.push(`<button class="classic-btn normal" id="${count++}" value=${index + 1}>${index + 1}</button>`);
                //sideview_question_status.push(`<button class="classic-btn normal" id="${count++}">${index + 1}</button>`);
            })
            const obj = {
                key : key,
                button :temp_button 
            }

            q_type_keys.push(obj);
        });
        /* setting clock to null because exam has not yet started */
        time_clock.innerHTML = "";

        /* storing the total time of exam received from server in a variable */
        // if(!localStorage.time)
        // {
        //     console.log("first time");
        //     total_time_for_exam = test.test_duration;
        // }
        // else{
        //     if(localStorage.time - test.test_duration > 30){
        //         total_time_for_exam = localStorage.time;
        //     }
        //     else{
        //         total_time_for_exam = test.test_duration;
        //     }
        //     console.log("LOCAL STORAGE TIME",localStorage.time)
            
        // }


        /* FOR test type */
        test_type = test.test_type;
        isEligible(test_type,test.test_duration);


        total_time_for_exam = test.test_duration;
        /* calling a method toggleClock() that is gonnna receive the total time of exam and handle it and update it ! */
        toggleClock(total_time_for_exam , test_type);

        /* setting the top-set slide none */
        question_type.innerHTML=""
        question_type.innerHTML=sets_for_types_of_question.join("");


        /* calling neccesary function to display question on web page and set timer */
        testBilder();
        intitDeclaration();
        showSlide(0);

    })


const myQuestions = [];


    let currentSlide = 0
    const button = 'BUTTON'
    const btns = document.getElementById('question-btns');
    const test = document.getElementById('test-container-all');

     /* DECLERATION OF GLOBAL VARIABLES !!!! */
     let slides;
     const marks = document.getElementById('marks');

     /* adding a variable for storing the questions-bar slides */
     const question_type=document.getElementById('question_type');
     const sideview_question_slide=[];
     /* setting the set at top  */
     const sets_for_types_of_question = [];
     /* adding a clear response button */
     let clear = document.getElementById('clear-response-btn');
     let review = document.getElementById('review-btn');
     let next = document.getElementById('next-btn')
     let prev = document.getElementById('prev-btn')
     let submit = document.getElementById('submit-btn')
     //let submit_btn_2 = document.getElementById('submit-btn-2')
     let questionNumber = document.getElementById('question-number');
     const sideview_question_status = [];
     let total_time_for_exam = 0;
     /* var to select the timer clock on web page */
     const time_clock = document.getElementById('time-clock');
     /* var to store the last slide number so that we can change the class*/
     let prevSlide = -1;
     /* question types */
     let q_type_keys=[]; 
     const keys=[];
     
     let q_types =[] ;
     let q_type_buttons;

        let key;


     /* marks of each question */
     let marks_of_each_question = [];
     let negative_of_each_question = [];
     /* variables for storing end time start time , will be stored in testtype */
     let test_type;
        let test_store;






/*---------------------------------------EVENT LISTENER----------------------------*/


btns.addEventListener('click', function (e) {
    e.preventDefault()
    if (e.target.tagName === button) {

        if (e.target.attributes.id === undefined)
            btnID = 0
        else
            btnID = parseInt(e.target.attributes.id.value)
        showSlide(btnID);
    }
    // e.target.attributes.id.value
    // e.target.attributes.class.value
   // console.log(e)
})


$('#f-screen').click()
function launchIntoFullscreen(element) {
    if (element.requestFullscreen) {
        element.requestFullscreen();
    } else if (element.mozRequestFullScreen) {
        element.mozRequestFullScreen();
    } else if (element.webkitRequestFullscreen) {
        element.webkitRequestFullscreen();
    } else if (element.msRequestFullscreen) {
        element.msRequestFullscreen();
    }
}


document.getElementById('f-screen').addEventListener('click', function (e) {
    launchIntoFullscreen(document.documentElement);

})

review.addEventListener('click', function (e) {
    e.preventDefault();
    console.log(currentSlide)
    showNextSlide();
    reviewed(currentSlide - 1);
})
prev.addEventListener('click', function (e) {
    e.preventDefault()
    showPreviousSlide()
})
next.addEventListener('click', function (e) {
    e.preventDefault()
    showNextSlide()
})
clear.addEventListener('click',function(e){
    e.preventDefault();
    clearResponse();
    clearAnswerResponse(currentSlide)
})

submit.addEventListener('click',function(e){
    e.preventDefault();
    console.log("SUBMITTED BUTTON CLICKED>>>>>>");
    console.log("TEST_STORE ",test_store);
    submitTest();
})

// submit_btn_2.addEventListener('click',function(e){
//     e.preventDefault();
//     console.log("SUBMITTED BUTTON CLICKED>>>>>>");
//     console.log("TEST_STORE ",test_store);
//     submitTest();
// })




function addEvent()
{
    q_type_buttons.map(button=>{
       // console.log(button)
        q_type_buttons[button].addEventListener('click',function(e){
            // console.log(e);
            // console.log("clicked");

            changeButtons(q_type_keys[button].key,button);
            toggleSetButtonClass(q_type_keys[button].key,button);
        })
    })
}


function toggleSetButtonClass(buttonKey,cbutton)
{
    console.log("TOGGLE SET BUTTON ",buttonKey,cbutton)
    q_type_buttons.map(button=>{
        if(button === cbutton)
        {
            q_type_buttons[button].removeAttribute('class','bg-blue-light');
            q_type_buttons[button].setAttribute('class','bg-blue tag2');
        }
        else{
            q_type_buttons[button].removeAttribute('class','bg-blue');
            q_type_buttons[button].setAttribute('class','bg-blue-light tag');
        }
       
     })

}



















/* ---------------------------------------Functions--------------------------------- */
function intitDeclaration() {
    slides = document.querySelectorAll(".slide")
    q_types=q_type_keys.map(obj=>{
    console.log("OBJ : ",obj);
      keys.push(obj.key);
      return `#${obj.key}`
  })
  q_type_buttons = $(`${q_types.join(',')}`);
   addEvent();
   changeButtons(q_type_keys[0].key,0);
   key=0;

   /* setting the diasabled true for submit button */
   submit.disabled = true;
   
toggleSetButtonClass(q_type_buttons,0)
}


function showSlide(n) {
    
    slides[currentSlide].classList.remove("active-slide")
    slides[n].classList.add("active-slide")
    currentSlide = n;
    console.log("N TH SLIDE : ",n);
    let q_number = parseInt(slides[n].getAttribute('name'))+1;
    questionNumber.innerHTML = q_number;
    let length =getSetLength(key);
    console.log("LENGTH : ",length)
    
    showButtons(n);
    
    showMarks(n);



    /* function that will change the class of the button */
    IsAnsweredOrIsSkipped(prevSlide);
    prevSlide = n;

}

/* showing button */
function showButtons(n)
{    
    // console.log("LENGTH>>>>>>>><<<<<<<<<<<<<<<<<<<",n)
    let length =getSetLength(key);
    const k = (((key-1) >= 0) ? (key-1) : -1);
    let startsetLength = getSetLength(k);
    // let difference = length-startsetLength;
    // console.log("_____________>>> ",length,startsetLength,difference);
    if (currentSlide === startsetLength) {
        prev.style.display = "none"
    } else {
        prev.style.display = "inline-block"
    }
    review.style.display = "block";
    if (currentSlide === length - 1) {
        next.style.display = "none"
        submit.style.display = "inline-block"
    } else {
        next.style.display = "inline-block"
       // submit.style.display = "none"
    }

}

function showMarks(n)
{
    marks.innerHTML=`<strong class="marks-sec">Mark for this question : <span id="positive">${marks_of_each_question[n]}</span> || Negative Marks : <span id="negative">${negative_of_each_question[n]}</span></strong>`
}


/* FUNCTION FOR SHOWING IMAGE OF USER AND ID FOR TEST */
function showUserInfo(user) {
    const photo_url = user.image_url;
    const user_id = user.id;
    const user_image = $('user_img');
    const user_unique_id = $('user_id');
    user_image.innerHTML=`<img src=${photo_url}>`;
    user_unique_id.innerHTML=`<strong>ID: ${user_id}</strong>`;
}




/* function to toggle the clock */
function toggleClock(total_duration,{type , start_time , end_time}) {
    let total_time = total_duration;
    if(type=='strict')
    {
        let currentTime = new Date().getTime();
        let actualTotalTime = end_time-currentTime;
        if(!(localStorage.total_time))
        {
            localStorage.total_time = actualTotalTime;
            total_time=actualTotalTime;
        }
    }
    setInterval(function () {
        setClock(total_time);
        randomUpdateTime(total_time);
        localStorage.total_time=total_time;
        if(total_time===(total_duration/2))
        {
            /* submit button available at half time */
            toggleSubmitButton();
            
        }
        
        /* calling function for each type of exam */
        if(type === 'strict')
        {
            /* calling strictExam() */
            strictExamSubmit(end_time , total_time);
        }
        else{
            /* calling for looseExam() */
            looseExamSubmit( end_time , total_time);
        }
        /* colorchange */
        if(total_time<300000)
        {
            changeTimeColor();
        }

        total_time = total_time - 1000;//because 1sec = 1000 milliseconds
    }, 1000)

}
function randomUpdateTime(total_time)
{
    let random = parseInt(getRandomInt(1,59));
    if(total_time%random === 0)
    {
        updateTime(total_time)
    }
}







/* strict and loose exam function */
function strictExamSubmit(end_time , total_time)
{
    const currentTime = newDate.getTime();
    if(total_time<=0 || currentTime === end_time)
    {
        window.location.href = '/strictExamSubmit';
    }
    /* FOR SHOWING TOAST */
    if(total_time===300000 || (end_time - currentTime) === 500000)
    {
        showToast();
    }
}

function looseExamSubmit(end_time , total_time)
{
    if(total_time<=0)
    {
        window.location.href = '/looseExamSubmit';
    }
    if(total_time===300000)
    {
        showToast();
    }
}

function isEligible({type , start_time , end_time},total_duration)
{
    if(type === 'strict')
    {
        isEligibleForStrictExam(start_time , end_time , total_duration);
    }
    else{
        isEligibleForLooseExam(start_time,end_time,total_duration);
    }
}

function isEligibleForStrictExam(start_time , end_time , total_duration){
    let currentDay = new Date().getTime();
    if(!(total_duration >0 && currentDay<end_time && currentDay>= start_time))
    {
        window.location.href='/notEligibleforstrict';
    }

}
function isEligibleForLooseExam(start_time,end_time,total_duration)
{
    let currentDay = new Date().getTime();
    if(!(total_duration >0  && currentDay>= start_time))
    {
        window.location.href='/notEligibleforloose';
    }
}



/* change attribute from disabled to availabe */
function toggleSubmitButton()
{
    submit.disabled=false;
}


/* function to handle the total time of exam and time elapsed */
function setClock(total_duration) {
    /* since total_duration will be in milli sec we need to convert it into sec and min and hrs asap */
    //created a function convertMillisecondsToDigitalClock
    const time = convertMillisecondsToDigitalClock(total_duration);
    const sec = time.seconds;
    const min = time.minutes;
    const hr = time.hours;
    /* if time is over */
    if(sec+min+hr===0)
    {
        //window.location="/exam-over";
        return;
    }
    let clock = "";
    if (hr == 0) {
        clock = min + "m" + " " + sec + "sec";
    }
    else {
        clock = hr + "hr" + " " + min + "m" + " " + sec + "sec";
    }
    time_clock.innerHTML = clock;

}

// CONVERT MILLISECONDS TO DIGITAL CLOCK FORMAT
function convertMillisecondsToDigitalClock(ms) {
    let hours = Math.floor(ms / 3600000); // 1 Hour = 36000 Milliseconds
    let minutes = Math.floor((ms % 3600000) / 60000); // 1 Minutes = 60000 Milliseconds
    let seconds = Math.floor(((ms % 360000) % 60000) / 1000); // 1 Second = 1000 Milliseconds
    return {
        hours: hours,
        minutes: minutes,
        seconds: seconds,
    };
}


function IsAnsweredOrIsSkipped(n) {
    /* to add the class visited to sidebar button */
    /* <button class="classic-btn normal" id="${count++}">${index + 1}</button> this is the html of button */
    console.log("INIT VALUE OF BTN n ",n);
    let resource = getButtonAndTags(n);
    const visited_button = resource.button;
    const inputTags = resource.tags;

    visited_button.removeClass();
    if (isAnswered(inputTags)) {
        storeAnswerToTestObj(n,inputTags);
        visited_button.addClass("classic-btn visited");
    }
    else {
        visited_button.addClass("classic-btn not-answered");
    }
}



/* storeAnswer */
function storeAnswerToTestObj(slideNumber,inputTags){
    //console.log("ANSWER SET ",key);
    let prevSlideLength = getLength(key);
    //console.log("HEY >>>>>>>>>>>>>>>>>>>>>>>>>>>",slideNumber - prevSlideLength);
    const questionNo  = parseInt(slideNumber - prevSlideLength);
    let answer = getAnsweredValue(inputTags);
    //console.log("QUESTION SET",test_store.question_set);
    //console.log(">>>>",q_type_keys[key].key);
    const set=q_type_keys[key].key;
    //console.log("SET NAME ",test_store.question_set[set-1]);
     //console.log("QUESTION ",test_store.question_set[set].questions[questionNo])
     test_store.question_set[set].questions[questionNo].answer = `${answer}`;  
     //console.log("ANSWER ",test_store.question_set[set].questions[questionNo].answer)

    };


function clearAnswerResponse(slideNumber){
    //console.log("ANSWER SET REMOVED ",key);
    let prevSlideLength = getLength(key);
    //console.log("HEY REMOVED >>>>>>>>>>>>>>>>>>>>>>>>>>>",slideNumber - prevSlideLength);
    const questionNo  = slideNumber - prevSlideLength;
    let answer = getAnsweredValue(inputTags);
    test_store.question_set.q_type_keys[key].questions[questionNo].answer =""; 
}

/* function for review button */
function reviewed(n) {
    let resource = getButtonAndTags(n);
    const reviewed_button = resource.button;
    const inputTags = resource.tags;
    reviewed_button.removeClass();
    if (isAnswered(inputTags)) {
        reviewed_button.addClass("classic-btn answered-to-review");
    }
    else {
        reviewed_button.addClass("classic-btn to-review");
    }
}


/* function that will return us button and input tags of slide */
function getButtonAndTags(n) {
    return {
        button: $(`#${n}`),
        tags: $(`:input[name="question${n}"]`)
    }
}

/* function that will receive the radio buttons group and check is answered or not */
function isAnswered(inputTags) {
    let isAnswered = false;
    inputTags.map((i) => {
        if (inputTags[i].checked) {
           // console.log("checked");
            isAnswered = true;
        }
    })
    return isAnswered;
}

function getAnsweredValue(inputTags){
    let Answer = "";
    inputTags.map((i) => {
        if (inputTags[i].checked) {
           // console.log("checked");
            Answer = inputTags[i].value;
        }
    })
    return Answer;
}


/* function for clearing response */
function clearResponse(){
    //console.log("IN CLEAR RESPONSE FUNCS")
    let inputTags = getButtonAndTags(currentSlide).tags;
    inputTags.map((i) => {
        if (inputTags[i].checked) {
           // console.log("checked");
           inputTags[i].checked=false;
        }
    })

}

function showNextSlide() {
    showSlide(currentSlide + 1)
}

function showPreviousSlide() {
    showSlide(currentSlide - 1)
}

function testBilder() {
    const questionSet = [];

    myQuestions.forEach(function (currentQuestion, questionNumber) {
        var qanswers = []
        //console.log(currentQuestion)
        for (option in currentQuestion.answers) {
            //console.log(currentQuestion.answers[option])
            qanswers.push(`<label>
                 <input type="radio" name="question${questionNumber}" value="${currentQuestion.answers[option]}">
                 
                  ${currentQuestion.answers[option]}
               </label>`)
        }
        questionSet.push(`<div class="slide" name=${currentQuestion.id}>
               <div class="question"> ${currentQuestion.question} </div>
               <div class="answers"> ${qanswers.join("")} 
               </div>
             </div>`);

    })
    btns.innerHTML = "";
    test.innerHTML = questionSet.join("");
}



function changeButtons(button_obj,index)
{
    //console.log("btn obj : ",button_obj);
    btns.innerHTML="";
    const temp_key = button_obj;
    q_type_keys.map(obj=>{
        if(obj.key===temp_key)
        {
            btns.innerHTML=`<h5 class="set">${obj.key}</h5>` + obj.button.join("");
        }
    })
    key=index;
    //console.log("CHANGE BUTTON S ----->>",key);
    showSlide(getLength(key));
    

   
}

function getLength(n)
{
   let length=0;
    for(i=0;i<n;i++)
    {
       length= length+q_type_keys[i].button.length;
    }
    return length;
}

function getSetLength(n)
{
    let length=0;
    for(i=0;i<=n;i++)
    {
       length= length+q_type_keys[i].button.length;
    }
    return length;
}

/* Function required for setting the time strict and loose functionality 
    1. update time 
        >>> will update time to server

    2. two methods for strict and loose clock
        a> strict clock (start_time , end_time , current_time , test_duration)
            logic:- 
                current_time should be <= to start_time and >= end time he can start anytime but at end_time exam is submitted to server
        b> loose clock (start_time , end_time , current_time , test_duration)
            logic:-
               exam can start before end_time and start_time and will run till test_duration is over

    3. hash function that decide after how many seconds after will we ping to server for saving test data and time
    4. storing the current status of test to server
        >>> that is storing the answer to the servers
    
    FAQ:-
    1. what happens if computer is shut down or window is closed
    >>> time will be stored in local storage and when the user opens the window again time will start from there only.
        and also the time will be stored to the server after a interval of time
    
    2. what happens if in strict time the user starts giving the test just before the end_time
    >>> user can start test at any time but there will be a function that will decrement the test_duration each 
    second so either the test_duration becomes or current_time = end_time exam will be stopped .
    3. in case of loose test
    >>> user can start giving test before the end time anytime even a second before but the test wont be over if current_time is equals to end_time
    , the test will get over once the test_duration is 0.


*/

function updateTime(time)
{
    localStorage.time = time;
    console.log("LOCAL STORAGE TIME : ",localStorage.time);
    updateServerTime(time);
}

function updateServerTime(time){
    console.log("PINGED SERVER !!!!");
    let updatedTime = JSON.stringify({'time':time})
    $.ajax({
        url:'http://localhost:3000/updateTime',
        type:"POST",
        data:updatedTime,
        contentType:"application/json; charset=utf-8",
        dataType:"json",
        success: function(data){
          console.log(data)
        }
      })
}


/* Showing toast at last min */
function showToast()
{
  const body =  $('body');
    body.append(`<div id="toast">5 Min Remaining !! Hurry Up </div>`)
  var x = document.getElementById("toast");
  x.className = "show";
  setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
  changeTimeColor();
}


/* function to change the color of time after showToast() is called */
function changeTimeColor()
{
    console.log(">>>!!!!>>>>",time_clock);
    // time_clock.removeClass('black');
    // time_clock.addClass('red');
    time_clock.removeAttribute('class','black');
    time_clock.style.color="red";
}






/* generate a random int which will ping server */
function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min)) + min; //The maximum is exclusive and the minimum is inclusive
  }

function submitTest()
{
    console.log("PINGED SERVER !!!!");
    let updatedTest = JSON.stringify({'test':test_store})
    $.ajax({
        url:'http://localhost:3000/submit',
        type:"POST",
        data:updatedTest,
        contentType:"application/json; charset=utf-8",
        dataType:"json",
        success: function(data){
          console.log(data)
        }
      })    
}

function activeSetButton()
{

}




})()



/* will remove the local storage variable */
 //when browser closed - psedocode
 $(window).on("unload", function(e){
    localStorage.removeItem(total_time);
  });