<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClaimForm.aspx.cs" Inherits="Insurance_Website.ClaimForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>

    <title>Revature Insurance</title>


    <link href="CSS/bootstrap-policy.css" rel="stylesheet" />



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.carqueryapi.com/js/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.carqueryapi.com/js/carquery.0.3.4.js"></script>
    <script type="text/javascript" src="JS/CarQuery.js"></script>

</head>
<body>
<div class="row" runat="server">
    <div class="col-md-6 col-md-offset-4">
        <form id="msform">
            <!-- progressbar -->
            <ul id="progressbar">
                <li class="active">Personal Details</li>
                <li>Add Vehicle</li>
                <li>Add Person</li>
                <li>Select Policy</li>
            </ul>
            <!-- fieldsets -->
            <fieldset>
                <h2 class="fs-title">Personal Details</h2>
                <h3 class="fs-subtitle">Tell us something more about you</h3>
                <input type="text" name="fname" placeholder="First Name"/>
                <input type="text" name="lname" placeholder="Last Name"/>
                <input type="text" name="zipcode" placeholder="Zipcode" />


                <input type="button" name="next" class="next action-button" value="Next"/>
            </fieldset>

            <fieldset>
                <h2 class="fs-title">Add Vehicle</h2>
                <h3 class="fs-subtitle"></h3>

                <select name="car-years" id="car-years"></select>  
                <select name="car-makes" id="car-makes"></select> 
                <select name="car-models" id="car-models"></select>
                <select name="car-model-trims" id="car-model-trims"></select>  

                <input type="button" name="previous" class="previous action-button-previous" value="Previous"/>
                <input type="button" name="next" class="next action-button" value="Next"/>
            </fieldset>

            <fieldset>
                <h2 class="fs-title">Add Person</h2>
                <h3 class="fs-subtitle">Who do you want on the policy</h3>


                <input type="button" name="previous" class="previous action-button-previous" value="Previous"/>
                <input type="button" name="next" class="next action-button" value="Next"/>
            </fieldset>

            <fieldset>
                <h2 class="fs-title">Select Policy</h2>
                <h3 class="fs-subtitle">Choose your policy</h3>

                <input type="button" name="previous" class="previous action-button-previous" value="Previous"/>
                <input type="submit" name="submit" class="submit action-button" value="Submit"/>
            </fieldset>
        </form>
    </div>
</div>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label5" runat="server" Text="Label">Claim number</asp:Label>
            <br />
            <asp:Literal ID="Literal1" runat="server">1234567890</asp:Literal>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Label">Incident</asp:Label>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                <asp:ListItem>Car Accident</asp:ListItem>
                <asp:ListItem>Hail Damage</asp:ListItem>
                <asp:ListItem>Vandalism</asp:ListItem>
                <asp:ListItem>Stolen</asp:ListItem>
            </asp:RadioButtonList>
            <br />
        </div>
        <br />
        <asp:Label ID="Label6" runat="server" Text="Label">Driver Injuries</asp:Label>
        <asp:RadioButtonList ID="RadioButtonList3" runat="server">
            <asp:ListItem>No injury</asp:ListItem>
            <asp:ListItem>Some injury</asp:ListItem>
            <asp:ListItem>Serious injury</asp:ListItem>
            <asp:ListItem>Permanent injury</asp:ListItem>
            <asp:ListItem>Fatality</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Label ID="Label7" runat="server" Text="Label">Other party injury</asp:Label>
        <asp:RadioButtonList ID="RadioButtonList4" runat="server">
            <asp:ListItem>No injury</asp:ListItem>
            <asp:ListItem>Some injury</asp:ListItem>
            <asp:ListItem>Serious injury</asp:ListItem>
            <asp:ListItem>Permanent injury</asp:ListItem>
            <asp:ListItem>Fatality</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Label">Car Damages</asp:Label>
        <asp:RadioButtonList ID="RadioButtonList2" runat="server">
            <asp:ListItem>Minor Damage</asp:ListItem>
            <asp:ListItem>Totalled</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Label ID="Label8" runat="server" Text="Label">Other party's car damages</asp:Label>
        <asp:RadioButtonList ID="RadioButtonList6" runat="server">
            <asp:ListItem>Minor Damage</asp:ListItem>
            <asp:ListItem>Totalled</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Label">Date incident occurred
</asp:Label>
        <br />
        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Label">Notes/Comments/Description</asp:Label>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Height="83px" Width="300px"></asp:TextBox>
    </form>
    <script type="text/javascript" src="JS/NextPrevSubmit.js"></script>
</body>
</html>
