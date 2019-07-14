<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClaimForm.aspx.cs" Inherits="Insurance_Website.ClaimForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>

    <title>Revature Insurance</title>

    <link href="CSS/bootstrap-policy.css" rel="stylesheet" />
</head>
<body>
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
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br/>
        <br/>

    </form>
</body>
</html>
