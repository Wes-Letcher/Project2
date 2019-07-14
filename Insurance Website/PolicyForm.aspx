<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PolicyForm.aspx.cs" Inherits="Insurance_Website.PolicyForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />

    <title>Revature Insurance</title>
    
    <link href="CSS/bootstrap-policy.css" rel="stylesheet" />

    <style>
        input[type=text],[type=password],[type=email]{
            height: 20px;
            width:250px;
            margin:auto;
            vertical-align: bottom;
        }
        input[type=radio]{
            width: 30px;
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
        .myfont{
            font-size:13px;
        }
        #vehicle_div div, #person_div div{
            padding-bottom: 25px;
        }
        #vehicle_div fieldset, #person_div fieldset{
            border: solid;
            border-width:3px;
        }
        #policy_table{
            border:outset;
            border-width:4px;
        }
    </style>

</head>
<body>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="Scripts/PolicyPage.js"></script>

    <!-- MultiStep Form -->
<div class="row">
    <div class="col-md-6 col-md-offset-3">
        <form id="msform" method="POST" runat="server">
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
                                    <th>Driving Record</th>

                                </tr>
                                <!------ROW-------->
                                <tr>
                                    <td><input type="text" name="firstname" id="firstname" placeholder="First Name"/></td>

                                    <td><select name="country" id="country1">
                                        <option value="-1" selected="selected" disabled="disabled">Select Country</option>
                                        <option value="CA">Canada</option>
                                        <option value="US">United States</option>
                                    </select></td>

                                    <td><input type="text" id="license" name="license" placeholder="Drivers License Number"/></td>

                                </tr>
                                <!------ROW-------->
                                <tr>
                                    <td><input type="text" id="lastname" name="lastname" placeholder="Last Name" /></td>

                                    <td><select name="state" id="state1">
                                        <option value="-1" selected="selected" disabled="disabled">----</option>
                                    </select></td>

                                    <td rowspan="3">
                                        <div style="margin:0px;padding:0px;">
                                            <p style="padding-right:20%;margin-bottom:5px;padding-bottom:5px;" class="myfont">Had Accident Within One Year:</p>
                                           
                                            <div style="margin-bottom:0px;padding-bottom:0px;">
                                                <label class="myfont" style="padding-right:55%;margin-bottom:0px;padding-bottom:0px;"><input type="radio" id="acc_one_yr_yes1" name="acc_one_yr1" style="width:30px;"/>Yes</label>
                                            </div>
                                            <div style="margin-bottom:0px;padding-bottom:0px;">
                                                <label class="myfont" style="padding-right:55%;margin-bottom:0px;padding-bottom:0px;"><input type="radio" id="acc_one_yr_no1" name="acc_one_yr1" style="width:30px;"/> No </label>
                                            </div>
                                        </div>

                                    </td>
                                </tr>

                                    
                                <!------ROW-------->
                                <tr>
                                    <td><input type="date" min="1900-01-01" max="2010-01-01" /></td>

                                    <td><input type="text" id="city" name="city" placeholder="City"/></td>
                    
                                </tr>
                                <!------ROW-------->
                                <tr>
                            
                                    <td><input type="password" name="social" placeholder="Social Security" /></td>

                                    <td><input type="text" name="street" placeholder="Street"/></td>
                                </tr>
                                <!------ROW-------->
                                <tr>
                                    <td><select name="gender">
                                        <option value="-1" selected="selected" disabled="disabled">Select Gender</option>
                                        <option value="male" >Male</option>
                                        <option value="female" >Female</option>
                                    </select></td>

                                    <td><input type="text" id="apt" name="apt" placeholder="Apt Number"/></td>

                                    
                                    <td rowspan="3">
                                        <div style="margin:0px;padding:0px;">
                                            <p style="padding-right:20%;margin-bottom:5px;padding-bottom:5px;" class="myfont">Had Accident Within Five Year:</p>
                                           
                                            <div style="margin-bottom:0px;padding-bottom:0px;">
                                                <label class="myfont" style="padding-right:55%;margin-bottom:0px;padding-bottom:0px;"><input type="radio" id="acc_five_yr_yes1" name="acc_five_yr1" style="width:30px;"/>Yes</label>
                                            </div>
                                            <div style="margin-bottom:0px;padding-bottom:0px;">
                                                <label class="myfont" style="padding-right:55%;margin-bottom:0px;padding-bottom:0px;"><input type="radio" id="acc_five_yr_no1" name="acc_five_yr1" style="width:30px;"/> No </label>
                                            </div>
                                        </div>
                                    </td>

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

                                    <td><input type="text" name="phone" placeholder="Phone Number"/></td>
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
          <!--      <input type="button" name="add" class="add action-button" value="Add Person" style="margin-left:20%;" id="add_person"/>
                <input type="button" name="remove" class="remove action-button" value="Remove Person" id="remove_person"/>  -->
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
                                    <td><select name="year1" class="year" id="year1"></select></td>
                                    <td><select name="make1" class="make" id="make1"></select></td>
                                    <td><select name="model1" class="model" id="model1">
                                        <option value="-1" selected="selected" disabled="disabled">----</option>
                                   </select></td>
                                </tr>
                            </table>
                        </fieldset>
                    </div>
                </div>

                <input type="button" name="next" class="next action-button" value="Next" style="margin-right:20%;" id="to_policy_stage"/>
                <input type="button" name="previous" class="previous action-button" value="Previous"/>
                
                <input type="button" name="add" class="add action-button" value="Add Vehicle" style="margin-left:20%;" id="add_vehicle"/>
                <input type="button" name="remove" class="remove action-button" value="Remove Vehicle" id="remove_vehicle"/>
            </div>

            <div class="policy_stage hide" id="select_policy_stage">

                <fieldset>
                    <h2 class="fs-title">Select Policy</h2>

                    <table id="policy_table">
                        <tr>
                            <th rowspan="2"><h3>Basic Policy</h3></th>
                            <th>Coverage Amount</th>
                            <th>Deductible</th>
                            <th rowspan="2"><h3>Extended Policy</h3></th>
                            <th>Coverage Amount</th>
                            <th>Deductible</th>
                        </tr>

                        <tr>
                        </tr>

                        <tr>
                            <td rowspan="2"><h4>Monthly Premium: </h4><span id="basic_premium"></span>$23.12</td>
                            <td><input id="basic_button" name="Get Policy" runat="server" type="submit" /></td>

                            <td rowspan="2"><h4>Monthly Premium: </h4><span id="extended_premium">$52.12</span></td>
                            <td><input id="extended_button" name="Get Policy" runat="server" type="submit"/></td>
                        </tr>

                        <tr>
                            <td>Liability (BI/PD)</td>
                            <td>$50k</td>
                            <td>$20k</td>
                            <td>Liability (BI/PD)</td>
                            <td>$250k</td>
                            <td>$50k</td>
                        </tr>

                        <tr>
                            <td>Medical</td>
                            <td rowspan="2">No Coverage</td>
                            
                            <td>Medical</td>
                            <td>$20k</td>
                            <td>$10k</td>
                        </tr>
                            
                        <tr>
                            <td>Collision</td>
                            <td rowspan="2">No Coverage</td>
                            
                            <td>Collision</td>
                            <td rowspan="2">$1000 Deductible</td>
                        </tr>

                        <tr>
                            <td>Other than Collision</td>
                            <td rowspan="2">No Coverage</td>
                            
                            <td>Other thanCollision</td>
                            <td rowspan="2">$1000 Deductible</td>
                            <td><input id="testinput" placeholder="First Name" name="testinput"/></td>
                        </tr>
                    </table>

                </fieldset>
                
                <input type="button" name="previous" class="previous action-button" value="Previous" style="margin-right:20%;"/>

            </div>

        </form>
    </div>
</div>

</body>
</html>
