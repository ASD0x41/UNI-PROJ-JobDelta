const nameInput = document.getElementById("Name_I");
const occupationInput = document.getElementById("Occupation_I");
const emailInput = document.getElementById("Email_I");
const nameElement = document.getElementById("name");
const occupationElement = document.getElementById("occupation");
const emailElement = document.getElementById("email");

const summaryInput = document.getElementById("summary_I");
const summaryElement = document.getElementById("summary");



// Modal elements
var personalInfoModal = document.getElementById("personal-info-modal");
var summaryModal = document.getElementById("summary-modal");
var jobModal = document.getElementById("Password-info-modal");

// Edit button elements
var personalInfoBtn = document.getElementById("personal-info-btn");
var summaryInfoBtn = document.getElementById("summary-info-btn");
var jobEditBtn = document.getElementById("ChangePassword");

// Close button elements
var closeBtns = document.getElementsByClassName("close");

// Open personal info modal when personal info edit button is clicked
personalInfoBtn.onclick = function () {
    personalInfoModal.style.display = "block";
}

// Open summary modal when summary edit button is clicked
summaryInfoBtn.onclick = function () {
    summaryModal.style.display = "block";
}


// Close modal when close button is clicked
for (var i = 0; i < closeBtns.length; i++) {
    closeBtns[i].onclick = function () {
        this.parentElement.parentElement.style.display = "none";
    }
}

// Close modal when user clicks outside of it
window.onclick = function (event) {
    if (event.target == personalInfoModal) {
        personalInfoModal.style.display = "none";
    }
    if (event.target == summaryModal) {
        summaryModal.style.display = "none";
    }
    if (event.target == jobModal) {
        jobModal.style.display = "none";
    }
}

jobEditBtn.addEventListener("click", function () {
    jobModal.style.display = "block";
});






