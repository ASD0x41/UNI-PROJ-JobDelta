// Get the popup container and close button elements
const popupContainer = document.querySelector('.popup-container');
const closeButton = document.querySelector('.close-button');

// Get the form element and add a submit event listener
const form = document.querySelector('form');
form.addEventListener('submit', (event) => {
    event.preventDefault(); // Prevent the default form submission behavior
});

// Function to open the popup
function openPopup() {
    popupContainer.style.display = 'block';
}

// Function to close the popup
function closePopup() {
    popupContainer.style.display = 'none';
}

// Add a click event listener to the "Find A New Job" button to open the popup
const findJobButton = document.querySelector('.Find_Button');
findJobButton.addEventListener('click', openPopup);

// Add a click event listener to the close button to close the popup
closeButton.addEventListener('click', closePopup);

// Close the popup when the user clicks outside the popup
window.addEventListener('click', function (event) {
    if (event.target == popupContainer) {
        closePopup();
    }
});


let slideIndex = 0;
const slides = document.getElementsByClassName("slide");

function showSlides() {
    for (let i = 0; i < slides.length; i++) {
        slides[i].classList.remove("active");
    }
    slideIndex++;
    if (slideIndex > slides.length) {
        slideIndex = 1;
    }
    slides[slideIndex - 1].classList.add("active");
    setTimeout(showSlides, 3000); // Change image every 5 seconds
}

showSlides();


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
