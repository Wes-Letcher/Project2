<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PolicyForm.aspx.cs" Inherits="Insurance_Website.PolicyForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
	
    <title>Revature Insurance</title>
    
    <link href="CSS/bootstrap-policy.css" rel="stylesheet" />
 
    <script type="text/javascript" src="https://www.carqueryapi.com/js/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.carqueryapi.com/js/carquery.0.3.4.js"></script>
    <script src="Scripts/CarApiConnection.js"></script>

    <style>
        input[type=text]{
            height: 20px;
        }
    </style>

</head>
<body>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="//geodata.solutions/includes/countrystatecity.js"></script>
    <script src="Scripts/ProfilePage.js"></script>

    <!-- MultiStep Form -->
<div class="row" runat="server">
    <div class="col-md-6 col-md-offset-3">
        <form id="msform">
            <!-- progressbar -->
            <ul id="progressbar">
                <li class="active">Add Person</li>
                <li>Add Vehicle</li>
                <li>Select Policy</li>
            </ul>
            <!-- fieldsets -->

            <div class="policy_stage" id="add_person_stage">

                <fieldset>
                    <h2 class="fs-title">Add Person</h2>
                    
                    <table>
                        <tr>
                            <td><input type="text" pattern="[A-Za-z]{20}" title="Letters Only" name="FirstName" placeholder="First Name" /></td>
                            
                        </tr>

                        <tr>
                            <td><input type="text" pattern="[A-Za-z]{20}" title="Letters Only" name="LastName" placeholder="Last Name" /></td>
                            
                        </tr>

                        <tr>
                            
                            <td><select name="country" class="countries order-alpha include-CA-US presel-0" id="countryId">
                                <option value="">Select Country</option>
                            </select></td>
                    
                            </tr>

                            <tr>
                                <td><select name="state" class="states order-alpha" id="stateId">
                                <option value="">Select State</option>
                                </select></td>
                            </tr>

                            <tr>
                                <td><select name="city" class="cities order-alpha" id="cityId">
                                <option value="">Select City</option>
                            </select></td>

                            </tr>
                    </table>
                    
                </fieldset>

                <div id="append_person">
                </div>

                <input type="button" name="next" class="next action-button" value="Next"/>
            </div>

            <div class="policy_stage hide" id="add_vehicle_stage">

               <fieldset>
                    <h2 class="fs-title">Add Vehicle</h2>

                    <select name="car-years" id="car-years"></select>  
                    <select name="car-makes" id="car-makes"></select> 
                    <select name="car-models" id="car-models"></select>
                    <select name="car-model-trims" id="car-model-trims"></select>  

                </fieldset>

                <div id="append_vehicle"></div>

                <input type="button" name="previous" class="previous action-button-previous" value="Previous"/>
                <input type="button" name="next" class="next action-button" value="Next"/>
            </div>


            <div class="policy_stage hide" id="select_policy_stage">

                <fieldset>
                    <h2 class="fs-title">Select Policy</h2>

                    
                </fieldset>

                <input type="button" name="previous" class="previous action-button-previous" value="Previous"/>
                <input type="submit" name="submit" class="submit action-button" value="Submit"/>
            </div>

        </form>
    </div>
</div>

</body>
</html>
