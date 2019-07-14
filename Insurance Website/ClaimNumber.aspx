<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClaimNumber.aspx.cs" Inherits="Insurance_Website.ClaimNumber" %>

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
                <h2 class="fs-title">Claim Number</h2>
                <h3 class="fs-subtitle">Here's your claim number</h3>
                <div>
                    Your claim number is:
                </div>
                <div id="claim_num">
                    123456789
                </div>
            </form>
        </div>
    </div>
</body>
</html>
