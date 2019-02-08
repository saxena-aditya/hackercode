


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
        })
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
                console.log(currentQuestion.answers[option])
                qanswers.push(`<label>
		             <input type="radio" name="question${questionNumber}" value="${currentQuestion.answers[option]}">
		             
		              ${currentQuestion.answers[option]}
		           </label>`)
            }
            questionSet.push(`<div class="slide">
		           <div class="question"> ${currentQuestion.question} </div>
		           <div class="answers"> ${qanswers.join("")} </div>
		         </div>`);

        })
        btns.innerHTML = "";
        test.innerHTML = questionSet.join("");
        btns.innerHTML = sideview_question_status.join("");

    }

    /* DECLERATION OF GLOBAL VARIABLES !!!! */
    let slides;
    let next = document.getElementById('next-btn')
    let prev = document.getElementById('prev-btn')
    let submit = document.getElementById('submit-btn')
    let questionNumber = document.getElementById('question-number');
    const sideview_question_status = [];

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

        if (currentSlide === slides.length - 1) {
            next.style.display = "none"
            submit.style.display = "inline-block"
        } else {
            next.style.display = "inline-block"
            submit.style.display = "none"
        }
    }


    prev.addEventListener('click', function (e) {
        e.preventDefault()
        showPreviousSlide()
    })
    next.addEventListener('click', function (e) {
        e.preventDefault()
        showNextSlide()
    })

    /* function to update time of test */
    const updateTime = () => {
        const currentTime = new Date().getTime();
        console.log(`updated time is : ${currentTime}`)

    }



}
)()


