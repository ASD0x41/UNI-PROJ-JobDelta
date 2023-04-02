
// Get the popup container element
var popupContainer = document.querySelector('.popup-container');

// Get the button that opens the popup
var postJobButton = document.querySelector('.sp_button');

// Get the close button for the popup
var closeButton = document.querySelector('.close-button');

// Function to open the popup
function openPostJob() {
    popupContainer.style.display = 'block';
}

// Function to close the popup
function closePostJob() {
    popupContainer.style.display = 'none';
}

// Close the popup when the close button is clicked
closeButton.addEventListener('click', function () {
    closePostJob();
});

// Close the popup when the user clicks outside the popup
window.addEventListener('click', function (event) {
    if (event.target == popupContainer) {
        closePostJob();
    }
});

/////////////////////////////////////////////////////////////////////

let slide2Index = 0;
const slides2 = document.getElementsByClassName("slide2");

function showSlides2() {
    for (let i = 0; i < slides2.length; i++) {
        slides2[i].classList.remove("active");
    }
    slide2Index++;
    if (slide2Index > slides2.length) {
        slide2Index = 1;
    }
    slides2[slide2Index - 1].classList.add("active");
    setTimeout(showSlides2, 3000); // Change image every 5 seconds
}

showSlides2();