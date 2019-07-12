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
<div class="row justify-content-center" runat="server">
    <div class="col-md-6 col-md-offset-3"> <!-- Change col-md-offset-(# of steps) number to match number of steps -->
        <form id="msform" class="justify-content-center">
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
                <div>
                    Incident Type: 
                    <select class="selectpicker" runat="server">
                        <option value="car_accident">Car Accident</option>
                        <option value="hail_damage">Hail Damage</option>
                        <option value="vandalism">Vandalism</option>
                        <option value="stolen">Stolen</option>
                    </select>
                </div>
                <br />
                <!-- <asp:Label ID="Label3" runat="server" Text="Label">Date incident occurred</asp:Label> -->
                
                <div class="row">
                    <div class="col">Date Incident Occured: </div>
                    <select class="selectpicker col" runat="server">
                        <option value="January">January</option>
                        <option value="February">February</option>
                        <option value="March">March</option>
                        <option value="April">April</option>
                        <option value="May">May</option>
                        <option value="June">June</option>
                        <option value="July">July</option>
                        <option value="August">August</option>
                        <option value="ber">September</option>
                        <option value="October">October</option>
                        <option value="November">November</option>
                        <option value="December">December</option>
                    </select>
                    <select class="selectpicker col" runat="server">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="20">20</option>
                        <option value="21">21</option>
                        <option value="22">22</option>
                        <option value="23">23</option>
                        <option value="24">24</option>
                        <option value="25">25</option>
                        <option value="26">26</option>
                        <option value="27">27</option>
                        <option value="28">28</option>
                        <option value="29">29</option>
                        <option value="30">30</option>
                        <option value="31">31</option>
                    </select>
                    <select class="selectpicker col" runat="server">
                        <option value="2019">2019</option>
                        <option value="2018">2018</option>
                        <option value="2017">2017</option>
                        <option value="2016">2016</option>
                        <option value="2015">2015</option>
                        <option value="2014">2014</option>
                        <option value="2013">2013</option>
                        <option value="2012">2012</option>
                        <option value="2011">2011</option>
                        <option value="2010">2010</option>
                        <option value="2009">2009</option>
                        <option value="2008">2008</option>
                        <option value="2007">2007</option>
                        <option value="2006">2006</option>
                        <option value="2005">2005</option>
                        <option value="2004">2004</option>
                        <option value="2003">2003</option>
                        <option value="2002">2002</option>
                        <option value="2001">2001</option>
                        <option value="2000">2000</option>
                        <option value="1999">1999</option>
                        <option value="1998">1998</option>
                        <option value="1997">1997</option>
                        <option value="1996">1996</option>
                        <option value="1995">1995</option>
                        <option value="1994">1994</option>
                        <option value="1993">1993</option>
                        <option value="1992">1992</option>
                        <option value="1991">1991</option>
                        <option value="1990">1990</option>
                        <option value="1989">1989</option>
                        <option value="1988">1988</option>
                        <option value="1987">1987</option>
                        <option value="1986">1986</option>
                        <option value="1985">1985</option>
                        <option value="1984">1984</option>
                        <option value="1983">1983</option>
                        <option value="1982">1982</option>
                        <option value="1981">1981</option>
                        <option value="1980">1980</option>
                    </select>
                </div>


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

    <script type="text/javascript" src="Scripts/JS/NextPrevSubmit.js"></script>
</body>
</html>
