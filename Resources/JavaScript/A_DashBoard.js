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

// Get the modal
var modal = document.getElementById("searchModal");

// Get the button that opens the modal
var btn = document.getElementById("searchBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function () {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function () {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of themodal, close it
window.onclick = function (event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

// When the user clicks the submit button, do something
var submitBtn = document.getElementById("submitBtn");
submitBtn.onclick = function () {
    var searchInput = document.getElementById("searchInput").value;
    // Do something with the search query, such as search for users
    console.log("Searching for users with query: " + searchInput);
    // Close the modal
    modal.style.display = "none";
}

