﻿$(document).ready(function () {
    //fieldsets
    var current_stage, next_stage, previous_stage;
    
    var max_vehicles = 5;
    var max_people = 5;

    var cur_vehicles = 1;
    var cur_people = 1;

    //load in txt files that hold the select options
    $("#year1").load("../Options/year.txt");
    $("#make1").load("../Options/make.txt");

    //load in a options file based on make
    $("#person_div").on("change", "select", function (event) {
        //get this id to update related select
        var country_id = event.target.id;
        var state_id = "state" + country_id[country_id.length - 1];

        console.log(country_id);
        console.log(state_id);
        console.log($(this).val());
        //loads the corresponding option txt file to select element
        $("#" + state_id).load("../Options/" + $(this).val() + "States.txt");
    });

    //load in a options file based on make
    $("#vehicle_div").on("change","select",function (event) {
        //get this id to update related select
        var make_id = event.target.id;
        var model_id = "model" + make_id[make_id.length - 1];

        console.log(make_id);
        console.log(model_id);
        console.log($(this).val());
        //loads the corresponding option txt file to select element
        $("#" + model_id).load("../Options/" + $(this).val() + ".txt");
    });

    //goes to next stage
    $(".next").click(function () {
        //button gets its parent
        current_stage = $(this).parent();
        next_stage = $(this).parent().next();

        //activate next step on progressbar using the index of next_fs
        $("#progressbar li").eq($(".policy_stage").index(next_stage)).addClass("active");

        next_stage.removeClass("hide");

        next_stage.show();
        current_stage.hide();
    });

    //goes to previous stage
    $(".previous").click(function () {
        current_stage = $(this).parent();
        previous_stage = $(this).parent().prev();

        //activate prev step on progressbar using the index of prev_stage
        $("#progressbar li").eq($(".policy_stage").index(previous_stage)).addClass("active");
        $("#progressbar li").eq($(".policy_stage").index(current_stage)).removeClass("active");

        previous_stage.show();
        current_stage.hide();
    });

    //adds a vehicle to the policy
    $("#add_vehicle").click(function () {
        if (cur_vehicles < max_vehicles) {
            cur_vehicles += 1;

            $("#vehicle_div").append(`
            <div>
                <fieldset class="fs_vehicle" id="vehicle${cur_vehicles}" style="margin:auto;">
                    <h2 class="fs-title">Add Vehicle</h2>

                   <table>
                       <tr>
                            <td><select name="year${cur_vehicles}" class="year" id="year${cur_vehicles}"></select></td>
                            <td><select name="make${cur_vehicles}" class="make" id="make${cur_vehicles}"></select></td>
                            <td><select name="model${cur_vehicles}" class="model" id="model${cur_vehicles}">
                                <option value="-1" selected="selected" disabled="disabled">----</option>
                            </select></td>
                        </tr>

                    </table>
                </fieldset>
            </div>`);

            //load in txt files that hold the select options
            $("#year" + cur_vehicles).load("../Options/year.txt");
            $("#make" + cur_vehicles).load("../Options/make.txt");
        } else {
            let msg = `The maximum number of cars per policy is ${max_vehicles}.`;
            alert(msg);
        }
    });

    //removes last vehicle added
    $("#remove_vehicle").click(function () {
        console.log(cur_vehicles);
        if (cur_vehicles > 1) {
            cur_vehicles -= 1;
            $("#vehicle_div").children().last().remove();
        }
    });

    //adds a person to the policy
    $("#add_person").click(function () {
        if (cur_people < max_people) {
            cur_people += 1;
            console.log(cur_people);
            $("#person_div").append(
                `<div>
                        <fieldset class="fs_person" id="person${cur_people}">
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
                                    <td><input type="text" pattern="[A-Za-z]{20}" title="Letters Only" name="FirstName" placeholder="First Name" /></td>

                                    <td><select name="country" id="country${cur_people}">
                                        <option value="-1" selected="selected" disabled="disabled">----</option>
                                        <option value="CA">Canada</option>
                                        <option value="US">United States</option>
                                    </select></td>

                                    <td><input type="text" pattern="[0-9A-Za-z]{15}" title="Number and letters only" name="driverslicense" placeholder="Drivers License Number"/></td>
                                </tr>
                                <!------ROW-------->
                                <tr>
                                    <td><input type="text" pattern="[A-Za-z]{20}" title="Letters Only" name="LastName" placeholder="Last Name" /></td>

                                    <td><select name="state" id="state${cur_people}">
                                        <option value="-1" selected="selected" disabled="disabled">----</option>
                                    </select></td>

                                    <td rowspan="3">
                                        <div style="margin:0px;padding:0px;">
                                            <p style="padding-right:20%;margin-bottom:5px;padding-bottom:5px;" class="myfont">Had Accident Within One Year:</p>
                                           
                                            <div style="margin-bottom:0px;padding-bottom:0px;">
                                                <label class="myfont" style="padding-right:55%;margin-bottom:0px;padding-bottom:0px;"><input type="radio" id="acc_one_yr_yes${cur_people}" name="acc_one_yr${cur_people}" style="width:30px;"/>Yes</label>
                                            </div>
                                            <div style="margin-bottom:0px;padding-bottom:0px;">
                                                <label class="myfont" style="padding-right:55%;margin-bottom:0px;padding-bottom:0px;"><input type="radio" id="acc_one_yr_no${cur_people}" name="acc_one_yr${cur_people}" style="width:30px;"/> No </label>
                                            </div>
                                        </div>
                                    </td>
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

                                    <td rowspan="3">
                                        <div style="margin:0px;padding:0px;">
                                            <p style="padding-right:20%;margin-bottom:5px;padding-bottom:5px;" class="myfont">Had Accident Within Five Year:</p>
                                           
                                            <div style="margin-bottom:0px;padding-bottom:0px;">
                                                <label class="myfont" style="padding-right:55%;margin-bottom:0px;padding-bottom:0px;"><input type="radio" id="acc_five_yr_yes${cur_people}" name="acc_five_yr${cur_people}" style="width:30px;"/>Yes</label>
                                            </div>
                                            <div style="margin-bottom:0px;padding-bottom:0px;">
                                                <label class="myfont" style="padding-right:55%;margin-bottom:0px;padding-bottom:0px;"><input type="radio" id="acc_five_yr_no${cur_people}" name="acc_five_yr${cur_people}" style="width:30px;"/> No </label>
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

                                    <td><input type="text" placeholder="Phone Number"/></td>
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
                `);

        } else {
            let msg = `The maximum number of people per policy is ${max_people}.`;
            alert(msg);
        }
    });

    //removes last person added
    $("#remove_person").click(function () {
        console.log(cur_people);
        if (cur_people > 1) {
            cur_people -= 1;
            $("#person_div").children().last().remove();
        }
    });

    //calc policy cost
    $("#to_policy_stage").click(function () {
        console.log("to policy");

        var basic_prem = 25.00;
        var recommended_prem = 50.00;

        var multiplier = 0;
        let accOneYr = document.querySelector(`input[name="acc_one_yr1"]:checked`).value;
        let accFiveYr = document.querySelector(`input[name="acc_five_yr1"]:checked`).value;

        if (accOneYr == "yes") {
            multiplier += 0.25;
            console.log("accOneYr+: " + multiplier);
        }

        if (accFiveYr == "yes") {
            multiplier += 0.1;
            console.log("accFiveYr+: " + multiplier);
        }

        if (accFiveYr == "no" && accOneYr == "no") {
            multiplier -= 0.1;
            console.log("2no: " + multiplier);
        }

        console.log("before: " + multiplier);
        switch (cur_vehicles) {
            case 1: multiplier += 1.0; break;
            case 2: multiplier += 1.95; break;
            case 3: multiplier += 2.85; break;
            case 4: multiplier += 3.65; break;
            case 5: multiplier += 4.40; break;
        }

        basic_prem *= multiplier;
        recommended_prem *= multiplier;

        console.log("mult: " + multiplier);
        console.log("basic: " + basic_prem);
        console.log("rec: " + recommended_prem);

        document.getElementById("show_basic").innerHTML = "$" + basic_prem.toFixed(2);
        document.getElementById("premium_basic").value = basic_prem.toFixed(2);
        document.getElementById("show_recommended").innerHTML = "$" +  recommended_prem.toFixed(2);
        document.getElementById("premium_recommended").value = recommended_prem.toFixed(2);
        var oo = 0;
    });

    $(".submit").click(function () {

    })

});