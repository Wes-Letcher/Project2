<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClaimValidatePage.aspx.cs" Inherits="Insurance_Website.ClaimValidatePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>

    <link href="CSS/bootstrap-claim.css" rel="stylesheet" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>Revature Insurance</title>
</head>
<body>
    <div class="row justify-content-center" runat="server">
        <div class="col-md-6 col-md-offset-3">
            <form id="form1" runat="server">
                <fieldset>
                    <h2 class="fs-title">Policy Number</h2>
                    <h3 class="fs-subtitle">Policy Number</h3>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Check" class="action-button" />
                </fieldset>
            </form>
        </div>
    </div>
</body>
</html>
