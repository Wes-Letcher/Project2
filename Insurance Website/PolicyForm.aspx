<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PolicyForm.aspx.cs" Inherits="Insurance_Website.PolicyForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
	
    <title>Revature Insurance</title>
    
    <link href="CSS/bootstrap-policy.css" rel="stylesheet" />

    <style>
        input[type=text],[type=password],[type=email]{
            height: 20px;
            width:250px;
            margin:auto;
            vertical-align: bottom;
        }
        table{
            margin: 0 auto;
            width:100%;
        }
        td {
          height: 25px;
          vertical-align: bottom;
        }
        .next,.previous,.submit{
            float:right;
        }
        .add,.remove{
            float:left;
        }
        #vehicle_div div, #person_div div{
            padding-bottom: 25px;
        }
        #vehicle_div fieldset, #person_div fieldset{
            border: solid;
            border-width:3px;
        }
        
    </style>

</head>
<body>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="Scripts/PolicyPage.js"></script>

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
                <div id="person_div">
                    <div>
                        <fieldset class="fs_person" id="person1">
                            <h2 class="fs-title">Add Person</h2>
                            <table>
                                <!------ HEAD-ROW-------->
                                <tr>
                                    <th>Personal Information</th>

                                    <th>Contact Infomation</th>

                                </tr>
                                <!------ROW-------->
                                <tr>
                                    <td><input type="text" pattern="[A-Za-z]{20}" title="Letters Only" name="firstname" placeholder="First Name" /></td>

                                    <td><select name="country" id="country1">
                                        <option value="-1" selected="selected" disabled="disabled">----</option>
                                        <option value="CA">Canada</option>
                                        <option value="US">United States</option>
                                    </select></td>
                                </tr>
                                <!------ROW-------->
                                <tr>
                                    <td><input type="text" pattern="[A-Za-z]{20}" title="Letters Only" name="lastname" placeholder="Last Name" /></td>

                                    <td><select name="state" id="state1">
                                        <option value="-1" selected="selected" disabled="disabled">----</option>
                                    </select></td>
                                </tr>
                                <!------ROW-------->
                                <tr>
                                    <td><input type="date" min="1900-01-01" max="2010-01-01" /></td>

                                    <td><input type="text" pattern="[A-Za-z'\-.]{25}" title="Only letters ' - . allowed" name="city" placeholder="City"/></td>
                    
                                </tr>
                                <!------ROW-------->
                                <tr>
                            
                                    <td><input type="password" name="social" placeholder="Social Security" pattern="[0-9]{3}-[0-9]{2}-[0-9]{4}" title="###-##-####" /></td>

                                    <td><input type="text" name="street" placeholder="Street"/></td>
                                </tr>
                                <!------ROW-------->
                                <tr>
                                    <td><select name="gender">
                                        <option value="-1" selected="selected" disabled="disabled">Select Gender</option>
                                        <option value="male" >Male</option>
                                        <option value="female" >Female</option>
                                    </select></td>

                                    <td><input type="text" pattern="[0-9]{7}" title="Max 7 numbers" name="apt" placeholder="Apt Number"/></td>

                                </tr>
                                <!------ROW-------->
                                <tr>
                                    <td><select name="maritalstatus">
                                        <option value ="-1" selected="selected" disabled="disabled">Select Marital Status</option>
                                        <option value="Single">Single</option>
                                        <option value="Married">Married</option>
                                        <option value="Divorced">Divorced</option>
                                        <option value="Widowed">Widowed</option>
                                    </select></td>

                                    <td><input type="text" pattern="[0-9]{3}-[0-9]{3}-{0-9}{4}" title="Format: ###-###-####" placeholder="Phone Number"/></td>
                                </tr>
                                <!------ROW-------->
                                <tr>
                                    <td><select name="employmentstatus">
                                        <option value ="-1" selected="selected" disabled="disabled">Select Employment Status</option>
                                        <option value="Employed">Employed</option>
                                        <option value="Unemployed">Unemployed</option>
                                        <option value="Student">Student</option>
                                    </select></td>

                                    <td><input type="email" name="email" placeholder="Email" /></td>
                                </tr>
                            </table>
                        </fieldset>
                    </div>
                </div>

                <input type="button" name="next" class="next action-button" value="Next" style="margin-right:20%;"/>
                <input type="button" name="add" class="add action-button" value="Add Person" style="margin-left:20%;" id="add_person"/>
                <input type="button" name="remove" class="remove action-button" value="Remove Person" id="remove_person"/>
            </div>

            <div class="policy_stage hide" id="add_vehicle_stage">

                <div id="vehicle_div">
                    <div>
                       <fieldset class="fs_vehicle" id="vehicle1">
                            <h2 class="fs-title">Add Vehicle</h2>
                           <table>
                               <tr>
                                   <th>Year</th>
                                   <th>Make</th>
                                   <th>Model</th>
                               </tr>

                               <tr>
                                    <td><select name="year" class="year" id="year1"></select></td>
                                    <td><select name="make" class="make" id="make1"></select></td>
                                    <td><select name="model" class="model" id="model1">
                                        <option value="-1" selected="selected" disabled="disabled">----</option>
                                   </select></td>
                                </tr>
                            </table>
                        </fieldset>
                    </div>
                </div>

                <input type="button" name="next" class="next action-button" value="Next" style="margin-right:20%;"/>
                <input type="button" name="previous" class="previous action-button" value="Previous"/>
                
                <input type="button" name="add" class="add action-button" value="Add Vehicle" style="margin-left:20%;" id="add_vehicle"/>
                <input type="button" name="remove" class="remove action-button" value="Remove Vehicle" id="remove_vehicle"/>
            </div>

            <div class="policy_stage hide" id="select_policy_stage">

                <fieldset>
                    <h2 class="fs-title">Select Policy</h2>
                </fieldset>

                <input type="submit" name="submit" class="submit action-button" value="Submit" style="margin-right:20%;"/>
                <input type="button" name="previous" class="previous action-button" value="Previous"/>

            </div>

        </form>
    </div>
</div>

</body>
</html>
