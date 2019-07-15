<%@ Page Title="Claim" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClaimPage.aspx.cs" Inherits="Insurance_Web.ClaimPage" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

  
<div class="row">
    <div class="col-md-offset-3" style="margin:auto">
        <div id="form">
            <!-- fieldsets -->
            <fieldset>
                <h2 class="fs-title">Claim Form</h2>
                <h3 class="fs-subtitle">Policy Number</h3>
                <asp:TextBox id="policy_num" runat="server"></asp:TextBox>
                <br />
                <br />

                <h3 class="fs-subtitle">Description</h3>
                <asp:TextBox ID="description2" TextMode="multiline" runat="server" Height="77px" Width="383px"></asp:TextBox>
                <br />
                
                <asp:Button ID="Button1" runat="server" OnClick="Button2_Click" Text="Submit" class="action-button" value="Submit" />
            </fieldset>
        </div>
    </div>
</div>
<script type="text/javascript" src="Scripts/JS/Claim.js"></script>
<script type="text/javascript" src="Scripts/JS/NextPrevSubmit.js"></script>

   
    
</asp:Content>
