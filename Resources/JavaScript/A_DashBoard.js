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


function OpenPopup(issueID, details) {
    // Set the text of the labels to display the issueID and details
    document.getElementById('<%= lblIssueID.ClientID %>').innerText = 'Issue ID: ' + issueID;
    document.getElementById('<%= lblDetails.ClientID %>').innerText = 'Details: ' + details;

    // Show the popup container
    document.getElementById('popupContainer').style.display = 'flex';
}

function ClosePopup() {
    // Hide the popup container
    document.getElementById('popupContainer').style.display = 'none';
}

