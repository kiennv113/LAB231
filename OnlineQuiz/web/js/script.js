this.timeRemaining = 60;
this.timeDisplay = document.getElementById("timeDisplay");
this.questionPos = document.getElementById("questionPos");
this.currentQuiz = 0;
this.currentDiv = null;
this.testing = 0;
this.numOfQuiz = 0;

var setNumOfQuiz = function (n) {
    numOfQuiz = n;
    this.timeRemaining = 60 * n;
    this.timeDisplay = document.getElementById("timeDisplay");
    this.questionPos = document.getElementById("questionPos");
    this.currentQuiz = 0;
    this.currentDiv = null;
    this.testing = 0;
};

var nextQuestion = function (k) {
    currentQuiz = (currentQuiz + k) % numOfQuiz;
    if (this.currentDiv !== null)
        this.currentDiv.classList.add("hidden");
    currentDiv = document.getElementById("q" + currentQuiz);
    currentDiv.classList.remove("hidden");
    questionPos.textContent = "Question: " + (currentQuiz +1) + "/" + numOfQuiz;


    if (numOfQuiz === 1) {
        document.getElementById("finish").removeAttribute("hidden");
    } else {
        if (currentQuiz === 0) {
            document.getElementById("bt-next").removeAttribute("hidden");
            document.getElementById("bt-previous").setAttribute("hidden", "");
        }
        if (currentQuiz === numOfQuiz-1) {
            document.getElementById("finish").removeAttribute("hidden");
            document.getElementById("bt-next").setAttribute("hidden", "");
            document.getElementById("bt-previous").removeAttribute("hidden");
        }
        if (numOfQuiz !== 2) {
            if (currentQuiz > 0 && currentQuiz < numOfQuiz - 1) {
                document.getElementById("bt-previous").removeAttribute("hidden");
                document.getElementById("bt-next").removeAttribute("hidden");
            }
        }
    }
};
var quizStart = function () {
    testing = 1;
    nextQuestion(1);
    nextQuestion(-1);
    setInterval(function () {
        timeRemaining--;
        updateTime();
        if (timeRemaining === 0) {
            testing = 0;
            document.getElementById("quizForm").submit();
        }
    }, 1000);
};

var updateTime = function () {
    var time = Math.floor(timeRemaining / 60);
    var sec = timeRemaining % 60;
    if (sec < 10) {
        sec = '0' + sec;
    }
    timeDisplay.textContent = time + ":" + sec;
};

window.onbeforeunload = function () {
    if (testing !== 0)
        return "Are you sure reload?";
};

