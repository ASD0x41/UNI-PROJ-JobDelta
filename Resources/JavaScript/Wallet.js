/*--------------------------------------------------------------------------*/


var addCardPopup = document.getElementById("add_card_popup");
var addCardButton = document.getElementById("add_card_button");


var closeButton = document.getElementsByClassName("popup_ci-close")[0];


addCardButton.onclick = function () {
    addCardPopup.style.display = "block";
}


closeButton.onclick = function () {
    addCardPopup.style.display = "none";
}


window.onclick = function (event) {
    if (event.target == addCardPopup) {
        addCardPopup.style.display = "none";
    }
}

/*--------------------------------------------------------------------------*/



/*--------------------------------------------------------------------------*/