$(document).ready(function () {
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
                <fieldset class="fs_vehicle" id="vehicle${cur_vehicles}">
                    <h2 class="fs-title">Add Vehicle</h2>

                   <table>
                       <tr>
                           <th>Year</th>
                           <th>Make</th>
                           <th>Model</th>
                       </tr>

                       <tr>
                            <td><select name="year" class="year" id="year${cur_vehicles}"></select></td>
                            <td><select name="make" class="make" id="make${cur_vehicles}"></select></td>
                            <td><select name="model" class="model" id="model${cur_vehicles}">
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

            $("#person_div").append(
                `<div>
                        <fieldset class="fs_person" id="person${cur_people}">
                            <h2 class="fs-title">Add Person</h2>
                            <table>
                                <!------ HEAD-ROW-------->
                                <tr>
                                    <th>Personal Information</th>

                                    <th>Contact Infomation</th>

                                </tr>
                                <!------ROW-------->
                                <tr>
                                    <td><input type="text" pattern="[A-Za-z]{20}" title="Letters Only" name="FirstName" placeholder="First Name" /></td>

                                    <td><select name="country" id="country${cur_people}">
                                        <option value="-1" selected="selected" disabled="disabled">----</option>
                                        <option value="CA">Canada</option>
                                        <option value="US">United States</option>
                                    </select></td>
                                </tr>
                                <!------ROW-------->
                                <tr>
                                    <td><input type="text" pattern="[A-Za-z]{20}" title="Letters Only" name="LastName" placeholder="Last Name" /></td>

                                    <td><select name="state" id="state${cur_people}">
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

    $(".submit").click(function () {
        return false;
    })

});