


(function () {
    /* function for getting test data */
    $.get('http://localhost:3000/', function (data, status) {
        console.log(data);
        const test = { ...data };

        //console.log(test);
        //console.log(test.question_set);
        if (data == 0)
            return;//if test was not received here

        /* result will hold the keys of the object now we can acces each object */
        let result = Object.keys((test.question_set));
        console.log(result);
        /* decleraing a variable count so that we can access the question set wise */
        let count = 0;
        result.map((key) => {
            console.log();
            sideview_question_status.push(`<h5 class="set">${key}</h5>`);
            test.question_set[key].questions.map((question, index) => {
                myQuestions.push({
                    question: question.question,
                    answers: question.options
                })
                //console.log(count);
                sideview_question_status.push(`<button class="classic-btn normal" id="${count++}">${index + 1}</button>`);
            })
        });
        /* setting clock to null because exam has not yet started */
        time_clock.innerHTML = "";

        /* storing the total time of exam received from server in a variable */
        total_time_for_exam = test.test_duration;

        /* calling a method toggleClock() that is gonnna receive the total time of exam and handle it and update it ! */
        toggleClock(total_time_for_exam);

        /* calling neccesary function to display question on web page and set timer */
        testBilder();
        intitDeclaration();
        showSlide(0);

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
    const myQuestions = [];




    let currentSlide = 0
    const button = 'BUTTON'
    const btns = document.getElementById('question-btns');
    const test = document.getElementById('test-container-all');
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
        console.log(e)
    })
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
            for (option in currentQuestion.answers) {
                //console.log(currentQuestion.answers[option])
                qanswers.push(`<label>
		             <input type="radio" name="question${questionNumber}" value="${currentQuestion.answers[option]}">
		             
		              ${currentQuestion.answers[option]}
		           </label>`)
            }
            questionSet.push(`<div class="slide">
		           <div class="question"> ${currentQuestion.question} </div>
                   <div class="answers"> ${qanswers.join("")} 
                   </div>
		         </div>`);

        })
        btns.innerHTML = "";
        test.innerHTML = questionSet.join("");
        btns.innerHTML = sideview_question_status.join("");

    }

    /* DECLERATION OF GLOBAL VARIABLES !!!! */
    let slides;
    let review = document.getElementById('review-btn');
    let next = document.getElementById('next-btn')
    let prev = document.getElementById('prev-btn')
    let submit = document.getElementById('submit-btn')
    let questionNumber = document.getElementById('question-number');
    const sideview_question_status = [];
    let total_time_for_exam = 0;
    /* var to select the timer clock on web page */
    const time_clock = document.getElementById('time-clock');
    /* var to store the last slide number so that we can change the class*/
    let prevSlide = -1;


    function intitDeclaration() {
        slides = document.querySelectorAll(".slide")

    }


    function showSlide(n) {
        questionNumber.innerHTML = n + 1
        slides[currentSlide].classList.remove("active-slide")
        slides[n].classList.add("active-slide")
        currentSlide = n;
        if (currentSlide === 0) {
            prev.style.display = "none"
        } else {
            prev.style.display = "inline-block"
        }
        review.style.display = "block";
        if (currentSlide === slides.length - 1) {
            next.style.display = "none"
            submit.style.display = "inline-block"
        } else {
            next.style.display = "inline-block"
            submit.style.display = "none"
        }

        /* function that will change the class of the button */
        IsAnsweredOrIsSkipped(prevSlide);
        prevSlide = n;

    }


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


    /* function to toggle the clock */
    function toggleClock(total_duration) {
        let total_time = total_duration;
        setInterval(function () {
            setClock(total_time);
            total_time = total_time - 1000;//because 1sec = 1000 milliseconds
        }, 1000)

    }



    /* function to handle the total time of exam and time elapsed */
    function setClock(total_duration) {
        /* since total_duration will be in milli sec we need to convert it into sec and min and hrs asap */
        //created a function convertMillisecondsToDigitalClock
        const time = convertMillisecondsToDigitalClock(total_duration);
        const sec = time.seconds;
        const min = time.minutes;
        const hr = time.hours;
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

        let resource = getButtonAndTags(n);
        const visited_button = resource.button;
        const inputTags = resource.tags;

        visited_button.removeClass();
        if (isAnswered(inputTags)) {
            visited_button.addClass("classic-btn visited");
        }
        else {
            visited_button.addClass("classic-btn not-answered");
        }
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
                console.log("checked");
                isAnswered = true;
            }
        })
        return isAnswered;
    }


}
)()


