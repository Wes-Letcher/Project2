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
    <div class="col-md-6 col-md-offset-2"> <!-- Change col-md-offset-(# of steps) number to match number of steps -->
        <form id="msform" runat="server">
            <!-- progressbar -->
            <ul id="progressbar">
                <li class="active">Type</li>
                <li>Damages</li>
            </ul>
            <!-- fieldsets -->
            <fieldset>
                <h2 class="fs-title">Claim Type</h2>
                <h3 class="fs-subtitle">Tell us what and when it happened</h3>
                <div>
                    Incident Type: 
                    <select class="selectpicker" runat="server" id="incident_type">
                        <option value="car_accident">Car Accident</option>
                        <option value="hail_damage">Hail Damage</option>
                        <option value="vandalism">Vandalism</option>
                        <option value="stolen">Stolen</option>
                    </select>
                </div>
                <br />
                <!-- <asp:Label ID="Label3" runat="server" Text="Label">Date incident occurred</asp:Label> -->
                
                <div class="">
                    <div class="">Date Incident Occured: </div>
                    <select class="selectpicker" runat="server" id="incidentMonth">
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
                    <select class="selectpicker" runat="server" id="incidentDay">
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
                    <select class="selectpicker" runat="server" id="incidentYear">
                        <option value="2019">2019</option>
                        <option value="2018">2018</option>
                        <option value="2017">2017</option>
                        <option value="2016">2016</option>
                        <option value="2015">2015</option>
                        <option value="2014">2014</option>
                    </select>
                </div>
                <br />
                <div class="form-group">
                    <label for="description">Notes/Comments/Description:</label>
                    <textarea class="form-control" runat="server" rows="5" id="comment"></textarea>
                </div> 

                <input type="button" name="next" class="next action-button" value="Next"/>
            </fieldset>

            <fieldset>
                <h2 class="fs-title">Own Damages</h2>
                <h3 class="fs-subtitle">Tell us what damages you and/or your car sustained</h3>
                <div>
                    Driver injuries: 
                    <select class="selectpicker" runat="server" id="driver_injuries">
                        <option value="No injuries">No injuries</option>
                        <option value="Some injuries">Some injuries</option>
                        <option value="Serious injuries">Serious injuries</option>
                        <option value="Permanent injuries">Permanent injuries</option>
                        <option value="Fatality">Fatality</option>
                    </select>
                </div>
                <div>
                    Damages to your car: 
                    <select id="driver_car_damages" runat="server">
                        <option value="Minor damages">Minor damages</option>
                        <option value="Totalled">Totalled</option>
                    </select>
                </div>
                <br />
                <h2 class="fs-title">Other Party's Damages</h2>
                <h3 class="fs-subtitle">Tell us what happened with the other party</h3>
                <div>
                    Driver injuries: 
                    <select class="selectpicker" runat="server" id="other_driver_injuries">
                        <option value="No injuries">No injuries</option>
                        <option value="Some injuries">Some injuries</option>
                        <option value="Serious injuries">Serious injuries</option>
                        <option value="Permanent injuries">Permanent injuries</option>
                        <option value="Fatality">Fatality</option>
                    </select>
                </div>
                <div>
                    Damages to their car: 
                    <select runat="server" id="other_car_damages">
                        <option value="Minor damages">Minor damages</option>
                        <option value="Totalled">Totalled</option>
                    </select>
                </div>

                <input type="button" name="previous" class="previous action-button-previous" value="Previous"/>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Submit" class="action-button" value="Submit" />
            </fieldset>
        </form>
    </div>
</div>
<script type="text/javascript" src="Scripts/JS/Claim.js"></script>
<script type="text/javascript" src="Scripts/JS/NextPrevSubmit.js"></script>

   
</body>
</html>
