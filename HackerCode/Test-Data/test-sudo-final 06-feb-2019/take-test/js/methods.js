console.log("METHODS.js")

$( function () {

    /* function for getting test data */
    $.get('http://localhost:3000/', function (data, status) {
        if (data == 0)
            window.location.href="/"//if test was not received here
            
            console.log("SERVER APPROACHED")
            console.log("data from server",data);
            //STORING THE RECEIVED DATA FROM SERVER TO VARIABLES
            const test = { ...data };
            test_store={...data}
            
            startTest(test);//function to initiate test and everything
    });
  




    //method that will be called to from ajax request to start and build the test
    function startTest(test)
    {
        //initialize test_store variable so that a copy of test can be stored and retured to the server !
        test_store = {...test};//copying test to test_store

        /* 
        now first thing to do is checking for eligibility of the user to take test or not ! 
        we need to pass the start_time , end_time , total duration of test & test_type
        */

        total_exam_duration     =   test.test_duration
        start_time              =   test.start_time
        end_time                =   test.end_time
        test_type               =   test.test_type
        test_started            =   test.test_started

        if(!test_started)
        {
            isEligible(start_time , end_time , total_exam_duration , test_type);//will check the eligibilty of user
            test_store.test_started = true;
            test_started            = true;
        }
        testBuilder(test_store.question_set);//will build the test slides and other useful stuff
        toggleClock(total_exam_duration,test_type,start_time,end_time);//will start the clock
    }


    function isEligible(start_time , end_time , total_exam_duration , test_type)
    {
        //here we will check that the type of test and will call the needful function
        if(test_type == 'strict')
            isEligibleForStrictExam(start_time,end_time);
        if(test_type == 'loose')
            isEligibleForLooseExam(start_time,end_time);

    }


    function isEligibleForStrictExam(start_time , end_time){
        let currentDay = new Date().getTime();
        if(!(total_exam_duration >0 && currentDay<end_time && currentDay>= start_time))
        {
            window.location.href='/notEligibleforstrict';
        }
    
    }
    function isEligibleForLooseExam(start_time,end_time)
    {
        let currentDay = new Date().getTime();
        if(!(total_duration >0  && currentDay>= start_time))
        {
            window.location.href='/notEligibleforloose';
        }
    }


    //Function to make the test the real test 
    function testBuilder(question_set)
    {
        let keysArray = Object.keys(question_set);//we will get the keys here such as set-1 , set-2 ,set-3
       keysArray.forEach(key=>{

        //key would be like set-1 set-2 set-3

            question_sets.push(key);//[set-1,set-2,set-3]
            question_set[key].questions.forEach((question,index)=>
            {   //question [{} , {} ,{} ]
                //{}
                    answer = null;
                    if(question.answer)
                    {
                        answer = question.answer[0];
                    }
                        /* adding slide to [] */
                        test_slides.push({
                            id: index+1,
                            question : question.question,//Question
                            answers : question.options,//Options 
                            markedAnswer : answer,//answer will be a array 
                            marks_for_question :question.marks,//storing marks
                            negative_for_question : question.negative//storing the negative marks 
                    
                    })
            })
        })

            initDecleration();//declaring variables
            slidesBuilder();//method calling for adding slides to DOM
            showSets();//method for showing sets button on test
            showSlide(0);//will show the first slide
            activeSet(0);//will set the active class for question_set_buttons
            loadSideButton(0);//will load the buttons at the side showing questions
            addEventListenerToSetButtons();//will add events to set buttons
    }
 

    /* method for declaring values */
    function initDecleration()
    {
        //variables
        current_question_set = 0;//will store the index of current question_sets
        previous_question_set = -1;//will store the index of previous question_sets

        //functions
    }



    /* for making slides div and adding to DOM */
    function slidesBuilder() {
        const questionSet = [];
        test_slides.forEach(function (currentQuestion, questionNumber) {
            var qanswers = []
            for (option in currentQuestion.answers) {
                if(currentQuestion.markedAnswer)
                {
                    if(currentQuestion.answers[option] === currentQuestion.markedAnswer)
                    {
                        qanswers.push(`<label>
                        <input type="radio" checked="true" name="question${questionNumber}" value="${currentQuestion.answers[option]}">
                        
                         ${currentQuestion.answers[option]}
                      </label>`)
                    }
                    else{
                        qanswers.push(`<label>
                        <input type="radio" name="question${questionNumber}" value="${currentQuestion.answers[option]}">
                        
                         ${currentQuestion.answers[option]}
                      </label>`)
                    }
                }
              else{
                    qanswers.push(`<label>
                    <input type="radio" name="question${questionNumber}" value="${currentQuestion.answers[option]}">
                    
                     ${currentQuestion.answers[option]}
                  </label>`)
                }
              
            }
            questionSet.push(`<div class="slide" name=${currentQuestion.id}>
                   <div class="question"> ${currentQuestion.question} </div>
                   <div class="answers"> ${qanswers.join("")} 
                   </div>
                 </div>`);
    
        })
        btns.innerHTML = "";
        test.innerHTML = questionSet.join("");

        slides = document.querySelectorAll(".slide");//stores all slides

    }

    function showSets()
    {
        let temp_set_buttons = question_sets.map((key,index)=>{
            return `<div class="tag bg-blue-light" id=${key}><p class="margin-0 tag-text fff">${key}</p></div>`
        })

        set_btns.innerHTML = temp_set_buttons.join("");
    }

    function addEventListenerToSetButtons()
    {
        for(let i=0;i<question_sets.length ;i++)
        {
            let key          =   question_sets[i];//set-1 set-2 set-3
            $(`#${key}`)[0].addEventListener('click',function(){
                activeSet(i);//change the class for activeSet
                loadSideButton(i);//will load the buttons at the side showing questions
            })
        }
    }


    /* for showing positive and negative marks on slide */
    function showMarks(right_answer , wrong_answer)
    {
         marks.innerHTML=`<strong class="marks-sec">Mark for this question : <span id="positive">${right_answer}</span> || Negative Marks : <span id="negative">${wrong_answer}</span></strong>`
    }

    
    function showSlide(n) {
    slides[currentSlide].classList.remove("active-slide")
    slides[n].classList.add("active-slide")

    previousSlide    =  currentSlide;//updating previous slide value
    currentSlide     =  n;//updating current slide value

    let q_number = test_slides[n].id;
    questionNumber.innerHTML = q_number;

    showTestButton(n);//for showing review , submit , next and previous button
    showMarks(test_slides[n].marks_for_question , test_slides[n].negative_for_question);//showing marks of a desired question
    }


    function showTestButton(n)
{
    //logic for implementing the change of slide

        let lower_limit_of_length    =   getLengthTillSetIndex(current_question_set);//will return the length till the starting of this set
        let set_length               =   getSetLength(current_question_set);//will return the length of current set ie how many question

        console.log(">>",lower_limit_of_length,set_length);
        let total_length             =   parseInt(lower_limit_of_length)+parseInt(set_length)-1;
        console.log(total_length , n)

        if(n === total_length)
        {
            //ie the not at the last question of set
            next.style.display       =  "none";
            prev.style.display       =  "inline-block";
        }
        else if(n===lower_limit_of_length)
        {
            //ie the first question of set
            next.style.display       =  "inline-block";
            prev.style.display       =  "none";
        }
        else
        {
            next.style.display       =  "inline-block";
            prev.style.display       =  "inline-block";
        }
    }


    function activeSet(index)
{
    let key = question_sets[index]; //will give set-1 set-2 set-3 
    let prev_key    = question_sets[current_question_set];//will give set-1 set-2 set-3

    const older_set_button  =   $(`#${prev_key}`)[0];//will give button
    const new_set_button    =   $(`#${key}`)[0];//will give the button 
    /*<div class="tag bg-blue-light" id=${key}><p class="margin-0 tag-text fff">${key}</p></div>*/

    //Now remove the class from the previous button and set the class of new button
    older_set_button.removeAttribute('class','bg-blue tag2');//remove the older active class
    older_set_button.setAttribute('class','bg-blue-light tag');//add the normal class

    new_set_button.removeAttribute('class','bg-blue-light');//remove the normal class
    new_set_button.setAttribute('class','bg-blue tag2');//add the active class

    previous_question_set   =     current_question_set;//updating the var
    current_question_set    =    index;//updating the var
    }

    function loadSideButton(index)
    {
        /*
            >>change the slide also when a button is clicked
            >>load the buttons to the right side of window
        */
       const key = question_sets[index];
       let sideViewButtons=[]//initialize a empty array to store sideview buttons
       let length = getLengthTillSetIndex(index);
       test_store.question_set[key].questions.forEach((question,index)=>{
            sideViewButtons.push(
                `<button class="classic-btn  ${question.status}" id="sideview${length+index}" value="${index+length}">${index + 1}</button>`
            )
       })
       btns.innerHTML="";
       btns.innerHTML = sideViewButtons.join("");
       addEventListenerToSideButtons(index);
       showSlide(length);//will show the first slide of set

    }

    //will be returning the length(starting point)
    function getLengthTillSetIndex(index)
    {
            const key = question_sets[index];
            let length = 0;
            for(let i =0; i<index ; i++)
            {
                const set_length = test_store.question_set[key].questions.length;
                length = length+ set_length;
            }

            return length;
    }

    function getSetLength(index)
    {
        const key = question_sets[index];
        let length = test_store.question_set[key].questions.length;
        return length;
    }


    function addEventListenerToSideButtons(index)
    {
        const sideViewButtons = $('#question-btns').children("button")//will select all the buttons
        console.log("SIDE",sideViewButtons.length);
        let true_length = getLengthTillSetIndex(index);
        let length = sideViewButtons.length;
        for(let i =0;i<length;i++)
        {
                const button = sideViewButtons[i];
                button.addEventListener('click',function(){
                    showSlide(true_length+i);//will update the slide
                    addAnsweredOrSkippedClass(previousSlide);//will add class to buttons
                })
        }
    }

    //will add class to current button
    function addAnsweredOrSkippedClass(slideNumber)
    {
        let {tags,button} = getButtonAndTags(slideNumber);
        button=button[0];
        let temp_length = getLengthTillSetIndex(current_question_set);
        const key   = question_sets[current_question_set];
        const index = slideNumber - temp_length;
        //test_store.question_set[key].questions
        if(isAnswered(tags))
        {
            button.setAttribute('class','classic-btn  visited');
            test_store.question_set[key].questions[index].status = "visited";//updating the status of button
        }
        else{
            button.setAttribute('class','classic-btn  not-answered');
            test_store.question_set[key].questions[index].status = "not-answered";//updating the status of button
        }
    }

      /* function for review button */
      function addReviewedOrNotReviewedClass(n) {
        let {button,tags} = getButtonAndTags(n);
        button=button[0];
        console.log(button)
        let temp_length = getLengthTillSetIndex(current_question_set);
        const key   = question_sets[current_question_set];
        const index = n - temp_length;

        if (isAnswered(tags)) {
            button.setAttribute('class',"classic-btn answered-to-review");
            test_store.question_set[key].questions[index].status = "answered-to-review";//updating the status of button
        }
        else {
            button.setAttribute('class',"classic-btn to-review");
            test_store.question_set[key].questions[index].status = "to-review";//updating the status of button
        }
    }

            /* CLOCK METHODS  */
            /* function to toggle the clock */
        function toggleClock(total_duration, type , start_time , end_time) {
            let total_time = total_duration;
            if(type=='strict')
            {
                let currentTime = new Date().getTime();
                let actualTotalTime = end_time-currentTime;
                if(localStorage.prev_time)
                {
                    localStorage.total_time = actualTotalTime;
                    total_time=localStorage.prev_time;
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
                total_exam_duration = total_time;
            }, 1000)

        }
        function randomUpdateTime(total_time)
        {
            let random = parseInt(getRandomInt(1,59));
            if(total_time%random === 0)
            {
                updateTime(total_time)
                testDataUpdate();
            }
        }


        /* change attribute from disabled to availabe */
        function toggleSubmitButton()
        {
            submit.disabled=false;
        }

        /* generate a random int which will ping server */
        function getRandomInt(min, max) {
            min = Math.ceil(min);
            max = Math.floor(max);
            return Math.floor(Math.random() * (max - min)) + min; //The maximum is exclusive and the minimum is inclusive
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

        function changeTimeColor()
        {
            time_clock.removeAttribute('class','black');
            time_clock.style.color="red";
        }

        function updateTime(time)
        {
            localStorage.time = time;
        }


    /* function that will return us button and input tags of slide */
    function getButtonAndTags(n) {
        return {
        button: $(`#sideview${n}`),
        tags: $(`:input[name="question${n}"]`)
        }
    }

    /* function that will receive the radio buttons group and check is answered or not */
        function isAnswered(inputTags) {
            let isAnswered = false;
            inputTags.map((i) => {
                if (inputTags[i].checked) {
                    isAnswered = true;
                }
            })
            if(isAnswered)
            {
                //will add the answer to test_store
                let temp_length = getLengthTillSetIndex(current_question_set);
                const key   = question_sets[current_question_set];
                const index = currentSlide - temp_length;
                const answer = getAnsweredValue(inputTags);
                console.log(">ANSWERED",answer);
                test_store.question_set[key].questions[index].answer = [`${answer}`];//updating the status of button
                
            }
            return isAnswered;
        }
  
    
    function getAnsweredValue(inputTags){
        let Answer = "";
        inputTags.map((i) => {
            if (inputTags[i].checked) {
                Answer = inputTags[i].value;
            }
        })
        return Answer;
    }

    /* function for clearing response */
    function clearResponse(){
        let inputTags = getButtonAndTags(currentSlide).tags;
        inputTags.map((i) => {
            if (inputTags[i].checked) {
                inputTags[i].checked=false;
            }
        })
        let temp_length = getLengthTillSetIndex(current_question_set);
        const key   = question_sets[current_question_set];
        const index = currentSlide - temp_length;
        test_store.question_set[key].questions[index].status = "not-answered";//updating the status of button
        test_store.question_set[key].questions[index].answer = undefined;//updating the answer
    }


    //EVENT LISTENER BUTTON
    review.addEventListener('click', function (e) {
        e.preventDefault();
        if(!(currentSlide === getSetLength(current_question_set)+getLengthTillSetIndex(current_question_set)))
        {
            addReviewedOrNotReviewedClass(currentSlide);
            showNextSlide();
        }
        else{
        
            addReviewedOrNotReviewedClass(currentSlide);
        }    
        
    })
    prev.addEventListener('click', function (e) {
        e.preventDefault()
        addAnsweredOrSkippedClass(currentSlide);
        showPreviousSlide()
    })
    next.addEventListener('click', function (e) {
        e.preventDefault()
        addAnsweredOrSkippedClass(currentSlide);
        showNextSlide()
    })
    clear.addEventListener('click',function(e){
        e.preventDefault();
        clearResponse();
    })
    
    submit.addEventListener('click',function(e){
        e.preventDefault();
        submitTest();
    })

    function showNextSlide() {
        showSlide(currentSlide + 1)
    }
    
    function showPreviousSlide() {
        showSlide(currentSlide - 1)
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
        if(total_time<=300000)
        {
            changeTimeColor();
        }
    }

   function testDataUpdate()
   {
    test_store.test_duration = total_exam_duration;
    let updatedTest = JSON.stringify({'test':test_store})
    console.log(test_store);
    $.ajax({
        url:'http://localhost:3000/updateTime',
        type:"POST",
        data:updatedTest,
        contentType:"application/json; charset=utf-8",
        dataType:"json",
        success: function(data){
          //console.log(data)
        }
      })
   }
    

})


/* will remove the local storage variable */
 //when browser closed - psedocode
 $(window).on("unload", function(e){
    localStorage.prev_time=localStorage.total_time;
   localStorage.removeItem(total_time);
 });