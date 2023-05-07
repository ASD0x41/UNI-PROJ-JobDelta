<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster2.Master" AutoEventWireup="true" CodeBehind="Wallet.aspx.cs" Inherits="JobDelta.Wallet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Resources/CSS/Wallet.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">

        function insufficient_funds() {
            const popup = document.querySelector("#insufficient-funds-popup");
            popup.style.display = "flex";
            setTimeout(function () { popup.style.display = "none"; }, 1000);
        }

    </script>


    <form action="#" runat="server">

 <section style="margin-top:5%;">
          <div class="container">
              <div class="card-info">
                                  <div class="card-holder">
                                    <h2>User Banking Information</h2>
                                    <h3>Name :&nbsp <asp:Label ID="NameLabel" runat="server" ></asp:Label></h3>
                                    <p style="font-weight:bold;">Bank Account :&nbsp <asp:Label ID="BankAccLabel" runat="server" ></asp:Label></p>
                                      <br />
                                     <p>Enter New Account No.:&nbsp&nbsp<asp:Textbox ID="C_BA" runat="server" CssClass="amount" Text=""></asp:Textbox></p>
                                      <br />
                                    <asp:button runat="server" CSSclass="sp_button" id="add_card_button" Text="Save" OnClick="ChangeBankAccount"></asp:button>
                                  </div>
                 </div>

                              <div class="balance">
                                  <br/>
                               <h3>Current Balance
                                 <br />
                                <asp:Literal runat="server" Text="$ "></asp:Literal>
                                <asp:Label runat="server" ID="Balance" Text="0.00"></asp:Label>
                                </h3>


                                  <br />
                                  <br />

                                  <asp:Label runat="server" Text="Total Deposits: $" AssociatedControlID="TotalDeposits"></asp:Label>
                                  <asp:Label runat="server" ID="TotalDeposits" Text="0.00"></asp:Label>
                                  <i class="fa fa-arrow-up" style="color:green"></i>
                                  <br/>
                                  <br/>
                                  <asp:Label runat="server" Text="Total Withdrawals: $" AssociatedControlID="TotalWithdrawals"></asp:Label>
                                  <asp:Label runat="server" ID="TotalWithdrawals" Text="0.00"></asp:Label>
                                  <i class="fa fa-arrow-down" style="color:red"></i>

                              </div>
                 </div>

<!------------------------------------------------------------------------------------------->

            <div class="parent-element">
              <p2 style = "font-weight: bold; font-size:20px "><p>Amount : &nbsp;<asp:TextBox ID="amount_label" runat="server" CssClass="amount" type="number" min="1"></asp:TextBox></p>
              <br />
              <div id="insufficient-funds-popup" class="popup-if">
                <p>Insufficient funds</p>
              </div>
              <br />
              <p2>
                <asp:button id="D_btn" runat="server" CssClass="deposit-button" Text="Deposite" OnClick="DepositMoney"></asp:button>
                <asp:button id="W_btn" runat="server" CssClass="withdraw-button" Text="WithDraw" Onclick="WithdrawMoney"></asp:button>
              </p2>
            </div>   
   </section>
            
<!------------------------------------------------------------------------------------------->

<section style="margin-bottom:10%;">
    <br />
    <br />
  <h1  style = "text-align:center; ">Transaction History</h1>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="ctable">
                <Columns>
                    <asp:BoundField DataField="transfertime" HeaderText="Transfer Time" />
                    <asp:BoundField DataField="amount" HeaderText="Amount" />
                    <asp:BoundField DataField="srcusername" HeaderText="Source User" />
                    <asp:BoundField DataField="dstusername" HeaderText="Destination User" />
                </Columns>
                <HeaderStyle BackColor="#CCCCCC" Font-Bold="true" />
            </asp:GridView>
      </section>


<!------------------------------------------------------------------------------------------->
</form>

    <script src="Resources/JavaScript/Wallet.js"></script>
</asp:Content>
