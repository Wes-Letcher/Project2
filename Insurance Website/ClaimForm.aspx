<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClaimForm.aspx.cs" Inherits="Insurance_Website.ClaimForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>

    <link href="HTML_Elements/Head.html" rel="import" />
    <title>Revature Insurance</title>

    <!--
        To change the number of steps in the progress bar:
        1. Add/remove from unordered list with id="progressbar" the necessary list items.
        2. Alter parent div class s.t. col-md-offset-(# of steps) contains the correct number of steps.
        3. In bootstrap-claim.css, in the #progress li properties, change the width property to be some percent of the new number of steps. 
            For Example, if steps = 4, width = 1/steps = 1/4 = 25%
    -->
    <link href="CSS/bootstrap-claim.css" rel="stylesheet" />




    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
    
    <!-- <script type="text/javascript" src="JS/CarQuery.js"></script> -->

</head>
<body>
<div class="row" runat="server">
    <div class="col-md-6 col-md-offset-3"> <!-- Change col-md-offset-(# of steps) number to match number of steps -->
        <form id="msform">
            <!-- progressbar -->
            <ul id="progressbar">
                <li class="active">Claim Type</li>
                <li>Own Damages</li>
                <li>Other Party's Damages</li>
            </ul>
            <!-- fieldsets -->
            <fieldset>
                <h2 class="fs-title">Claim Type</h2>
                <h3 class="fs-subtitle">Tell us what and when it happened</h3>
                <select class="selectpicker" runat="server">
                    <option value="car_accident">Car Accident</option>
                    <option value="hail_damage">Hail Damage</option>
                    <option value="vandalism">Vandalism</option>
                    <option value="stolen">Stolen</option>
                </select>
                <br />
                <asp:Label ID="Label3" runat="server" Text="Label">Date incident occurred</asp:Label>
                <!-- <embed src="HTML_Elements/Calendar.html" /> -->


                <input type="button" name="next" class="next action-button" value="Next"/>
            </fieldset>

            <fieldset>
                <h2 class="fs-title">Own Damages</h2>
                <h3 class="fs-subtitle"></h3>

                <!--
                    <select name="car-years" id="car-years"></select>  
                    <select name="car-makes" id="car-makes"></select> 
                    <select name="car-models" id="car-models"></select>
                    <select name="car-model-trims" id="car-model-trims"></select>  
                -->

                <input type="button" name="previous" class="previous action-button-previous" value="Previous"/>
                <input type="button" name="next" class="next action-button" value="Next"/>
            </fieldset>

            <fieldset>
                <h2 class="fs-title">Other Party's Damages</h2>
                <h3 class="fs-subtitle"></h3>


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
            <select class="selectpicker" runat="server">
                <option value="car_accident">Car Accident</option>
                <option value="hail_damage">Hail Damage</option>
                <option value="vandalism">Vandalism</option>
                <option value="stolen">Stolen</option>
            </select>
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
        <asp:Label ID="Label4" runat="server" Text="Label">Notes/Comments/Description</asp:Label>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Height="83px" Width="300px"></asp:TextBox>
    </form>

    <script type="text/javascript" src="JS/NextPrevSubmit.js"></script>
</body>
</html>
