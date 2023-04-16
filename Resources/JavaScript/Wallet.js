let balance = 0;
let totalDeposits = 0;
let totalWithdrawals = 0;

const tableBody = document.querySelector("#table-body");

const depositButton = document.querySelector("#deposit-button");
depositButton.addEventListener("click", deposit);

const withdrawButton = document.querySelector("#withdraw-button");
withdrawButton.addEventListener("click", withdraw);

function deposit() {

    const amount = parseFloat(document.querySelector("#amount").value);
    if (amount > 0) {
        balance += amount;
        totalDeposits += amount;
        updateBalance();
        updateTotalDeposits();
        addTransaction(amount, "Deposit");
    }
}

function withdraw() {
    const amount = parseFloat(document.querySelector("#amount").value);
    if (amount > balance) {
        const popup = document.querySelector("#insufficient-funds-popup");
        popup.style.display = "flex";
        setTimeout(function () { popup.style.display = "none"; }, 1000);
        return;
    }
    else if (amount > 0) {
        balance -= amount;
        totalWithdrawals += amount;
        updateBalance();
        updateTotalWithdrawals();
        addTransaction(amount, "Withdrawal");
    }
}

function updateBalance() {
    const balanceElement = document.querySelector("#Balance");
    balanceElement.textContent = balance.toFixed(2);
}

function addTransaction(amount, type) {
    const date = new Date().toLocaleString();
    const row = document.createElement("tr");
    const amountCell = document.createElement("td");
    const typeCell = document.createElement("td");
    const dateCell = document.createElement("td");
    amountCell.textContent = amount.toFixed(2);
    typeCell.textContent = type;
    dateCell.textContent = date;
    row.appendChild(amountCell);
    row.appendChild(typeCell);
    row.appendChild(dateCell);

    const firstRow = tableBody.firstChild;

    if (firstRow) {
        tableBody.insertBefore(row, firstRow);
    }

    else {
        tableBody.appendChild(row);
    }
}

function updateTotalDeposits() {
    const totalDepositsElement = document.querySelector("#TotalDeposits");
    totalDepositsElement.textContent = totalDeposits.toFixed(2);
}

function updateTotalWithdrawals() {
    const totalWithdrawalsElement = document.querySelector("#TotalWithdrawals");
    totalWithdrawalsElement.textContent = totalWithdrawals.toFixed(2);
}

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

const cardNumberSpan = document.getElementById("Card_No");
const expiryDateSpan = document.getElementById("Ex_date");
const cvvNumberSpan = document.getElementById("CVV_No");

const form = document.querySelector("form");
form.addEventListener("submit", function (event) {
    event.preventDefault();

    const cardNumberInput = document.getElementById("card_number");
    const expiryDateInput = document.getElementById("expiry_date");
    const cvvInput = document.getElementById("cvv");

    cardNumberSpan.textContent = cardNumberInput.value;
    expiryDateSpan.textContent = expiryDateInput.value;
    cvvNumberSpan.textContent = cvvInput.value;

    form.reset();
});

/*--------------------------------------------------------------------------*/