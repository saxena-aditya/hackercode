(function() {
	$('#f-screen').click()
	function launchIntoFullscreen(element) {
  if(element.requestFullscreen) {
    element.requestFullscreen();
  } else if(element.mozRequestFullScreen) {
    element.mozRequestFullScreen();
  } else if(element.webkitRequestFullscreen) {
    element.webkitRequestFullscreen();
  } else if(element.msRequestFullscreen) {
    element.msRequestFullscreen();
  }
}
document.getElementById('f-screen').addEventListener('click', function(e) {
  launchIntoFullscreen(document.documentElement); 
 
})
    const myQuestions = [{
        question: "Who is the strongest?",
        answers: {
            a: "Superman",
            b: "The Terminator",
            c: "Waluigi, obviously"
        },
        correctAnswer: "c"
    }, {
        question: "What is the best site ever created?",
        answers: {
            a: "SitePoint",
            b: "Simple Steps Code",
            c: "Trick question; they're both the best"
        },
        correctAnswer: "c"
    }, {
        question: "Where is Waldo really?",
        answers: {
            a: "Antarctica",
            b: "Exploring the Pacific Ocean",
            c: "Sitting in a tree",
            d: "Minding his own business, so stop asking"
        },
        correctAnswer: "d"
    }]

    let currentSlide = 0
    const button = 'BUTTON'
    const btns = document.getElementById('question-btns');
    const test = document.getElementById('test-container-all');
    btns.addEventListener('click', function(e) {
        e.preventDefault()
        if (e.target.tagName === button){
        	
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
        const questionSet = []
        myQuestions.forEach(function(currentQuestion, questionNumber) {
            var qanswers = []
            for (option in currentQuestion.answers) {
                qanswers.push(`<label>
		             <input type="radio" name="question${questionNumber}" value="${option}">
		             
		              ${currentQuestion.answers[option]}
		           </label>`)
            }
            questionSet.push(`<div class="slide">
		           <div class="question"> ${currentQuestion.question} </div>
		           <div class="answers"> ${qanswers.join("")} </div>
		         </div>`);

        })
        test.innerHTML = questionSet.join("")
    }
    testBilder()
    const slides = document.querySelectorAll(".slide")
    const next = document.getElementById('next-btn')
    const prev = document.getElementById('prev-btn')
    const submit = document.getElementById('submit-btn')
    const questionNumber = document.getElementById('question-number');

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
    showSlide(0)

    prev.addEventListener('click', function(e) {
    	e.preventDefault()
    	showPreviousSlide()
    })
    next.addEventListener('click', function(e) {
    	e.preventDefault()
    	showNextSlide()
    })

}
)()
