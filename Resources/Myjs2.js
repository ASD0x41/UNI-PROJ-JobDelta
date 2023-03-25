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