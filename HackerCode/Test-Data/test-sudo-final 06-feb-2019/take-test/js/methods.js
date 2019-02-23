console.log("METHODS.js")

$( function () {

    /* function for getting test data */
    $.get('http://localhost:3000/', function (data, status) {
        if (data == 0)
            return;//if test was not received here
            
            console.log("SERVER APPROACHED")
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

        isEligible(start_time , end_time , total_exam_duration , test_type);//will check the eligibilty of user
        testBuilder(test_store.question_set);
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

                        /* adding slide to [] */
                        test_slides.push({
                            id: index+1,
                            question : question.question,//Question
                            answers : question.options,//Options 
                            markedAnswer : question.answer[0],//answer will be a array 
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

        let total_length             =   lower_limit_of_length+set_length-1;

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
        let length = test_store.question_set[key].length;
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
                console.log(button);
                button.addEventListener('click',function(){
                    showSlide(true_length+i);//will update the slide
                    addClass(previousSlide);//will add class to buttons
                })
        }
    }


    function addClass(slideNumber)
    {
        slides[slideNumber]
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
                // //console.log("checked");
                    isAnswered = true;
                }
            })
            return isAnswered;
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
    
    function getAnsweredValue(inputTags){
        let Answer = "";
        inputTags.map((i) => {
            if (inputTags[i].checked) {
               // //console.log("checked");
                Answer = inputTags[i].value;
            }
        })
        return Answer;
    }


    //EVENT LISTENER BUTTON
    review.addEventListener('click', function (e) {
        e.preventDefault();
        //console.log(currentSlide)
        //console.log("INSIDE REVIEW BUTON ",getSetLength(key))
        if(!(currentSlide === getSetLength(current_question_set)+getLengthTillSetIndex(current_question_set)))
        {
            showNextSlide();
            reviewed(currentSlide - 1);
        }
        else{
        
            reviewed(currentSlide);
        }    
        
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
        submitTest();
    })


    function clearAnswerResponse(slideNumber){
      
    }

})