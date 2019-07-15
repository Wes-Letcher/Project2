<%@ Page Title="Claim" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClaimPage.aspx.cs" Inherits="Insurance_Web.ClaimPage" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

  
<div class="row">
    <div class="col-md-offset-3" style="margin:auto">
        <div id="form">
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
                <!-- <div class="form-group d-flex justify-content-center">
                    <label for="description">Notes/Comments/Description:</label>
                    <textarea class="form-control" runat="server" rows="5" id="comment"></textarea>
                </div> -->

                <h3 class="fs-subtitle">Own Damages</h3>
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
                <h3 class="fs-subtitle">Other Party's Damages</h3>
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

                <asp:Button ID="Button1" runat="server" OnClick="Button2_Click" Text="Submit" class="action-button" value="Submit" />
            </fieldset>
        </div>
    </div>
</div>
<script type="text/javascript" src="Scripts/JS/Claim.js"></script>
<script type="text/javascript" src="Scripts/JS/NextPrevSubmit.js"></script>

   
    
</asp:Content>
