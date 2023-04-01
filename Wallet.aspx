<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster2.Master" AutoEventWireup="true" CodeBehind="Wallet.aspx.cs" Inherits="JobDelta.Wallet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Resources/CSS/Wallet.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <section style="margin-top:5%;">
          <div class="container">
              <div class="card-info">
                                  <div class="card-holder">
                                    <h2>Card Holder Information</h2>
                                    <p>Name :&nbsp ABC XYZ</p>
                                    <p>Card Number :&nbsp <span id="Card_No">XXXX XXXX XXXX 1234</span></p>
                                    <p>Expiration Date :&nbsp <span id="Ex_date">XX/XX</span></p>
                                    <p>CVV :&nbsp <span id="CVV_No">XXX</span></p>
                                      <br />
                                      <br />
                                    <button class="sp_button" id="add_card_button">ADD CARD</button>
                                  </div>
                 </div>

                              <div class="balance">
                               <h3>Current Balance
                             <br />$ &nbsp<span id="Balance">0.00</span></h3>

                                  <br />
                                  <br />

                                  <p> Total Deposits: $<span id="TotalDeposits">0.00</span> <i class="fa fa-arrow-up" style = "color:green"></i></p>
                                  <p> Total Withdrawals: $<span id="TotalWithdrawals">0.00</span> <i class="fa fa-arrow-down" style = "color:red"></i></p>
                              </div>
                 </div>

<!------------------------------------------------------------------------------------------->

            <div class="parent-element">
              <p2 style = "font-weight: bold; font-size:20px ">Amount : &nbsp; <input type="number" id="amount" min="1"/></p2>
              <br />
              <div id="insufficient-funds-popup" class="popup-if">
                <p>Insufficient funds</p>
              </div>
              <br />
              <p2>
                <button id="deposit-button">Deposit</button>
                <button id="withdraw-button">Withdraw</button>
              </p2>
            </div>   
   </section>
            
<!------------------------------------------------------------------------------------------->

<section style="margin-bottom:10%;">
    <br />
    <br />
  <h1  style = "text-align:center; ">Transaction History</h1>
    <br />
    <table>
        <thead>
            <tr>
                <th>Amount</th>
                <th>Type</th>
                <th>Date</th>
            </tr>
        </thead>
        <tbody id="table-body">
        </tbody>
    </table>
      </section>

<!------------------------------------------------------------------------------------------->

         <div id="add_card_popup" class="popup_ci">
          <div class="popup_ci-content">
            <span class="popup_ci-close">&times;</span>
            <h2>Add a Card</h2>
                     
                       <br/>
                       <br/>

                      <label for="card_number">Card Number:</label>
                      <input type="text" style="width:150px; text-align:center" id="card_number" name="card_number" pattern="[0-9]{13}"  title = "Please enter a valid card number" required="required" maxlength = "13" /><br /><br />
                        <br/>
                      <label for="expiry_date">Expiry Date:</label>
                      <input type="text" id="expiry_date" style="width:80px; text-align:center" name="expiry_date" pattern="^(0[1-9]|1[0-2])\/(2[2-9]|[3-9][0-9])$" title = "Please enter a valid expiry date in the format MM/YY" required="required" /><br /><br />
                        <br/>
                      <label for="cvv">CVV:</label>
                      <input type="text" id="cvv" name="cvv" style="width:60px; text-align:center " pattern="[0-9]{3}" title="Please enter a valid CVV (3 digits)" required="required" maxlength = "3" /><br /><br />
                       <br/>
                       <br/>
                      <div style="margin-left:37%;"><input type="submit" class="sp_button" value="Submit"/></div>
          </div>
        </div>

<!------------------------------------------------------------------------------------------->


    <script src="Resources/JavaScript/Wallet.js"></script>
</asp:Content>
