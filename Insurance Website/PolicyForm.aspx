<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PolicyForm.aspx.cs" Inherits="Insurance_Website.PolicyForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
	
    <title>Revature Insurance</title>

    
    <link href="CSS/bootstrap-policy.css" rel="stylesheet" />



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.carqueryapi.com/js/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.carqueryapi.com/js/carquery.0.3.4.js"></script>



	<script type="text/javascript">
        $(document).ready(
            function()
            {
            //Create a variable for the CarQuery object.  You can call it whatever you like.
            var carquery = new CarQuery();
        
            //Run the carquery init function to get things started:
            carquery.init();
             
            //Optional: Pass sold_in_us:true to the setFilters method to show only US models. 
            carquery.setFilters( {sold_in_us:true} );
        
            //Optional: initialize the year, make, model, and trim drop downs by providing their element IDs
            carquery.initYearMakeModelTrim('car-years', 'car-makes', 'car-models', 'car-model-trims');
        
            //Optional: set the onclick event for a button to show car data.
            $('#cq-show-data').click(  function(){ carquery.populateCarData('car-model-data'); } );
        
            //Optional: initialize the make, model, trim lists by providing their element IDs.
            carquery.initMakeModelTrimList('make-list', 'model-list', 'trim-list', 'trim-data-list');
        
            //Optional: set minimum and/or maximum year options.
            //carquery.year_select_min=1990;
            //carquery.year_select_max=2019;
         
            carquery.initSearchInterface();
        
            //If creating a search interface, set onclick event for the search button.  Make sure the ID used matches your search button ID.
            $('#cq-search-btn').click( function(){ carquery.search(); } );
        });
    </script>
    


</head>
<body>
    <!-- MultiStep Form -->
<div class="row" runat="server">
    <div class="col-md-6 col-md-offset-4">
        <form id="msform">
            <!-- progressbar -->
            <ul id="progressbar">
                <li class="active">Personal Details</li>
                <li>Add Vehicle</li>
                <li>Add Person</li>
                <li>Select Policy</li>
            </ul>
            <!-- fieldsets -->
            <fieldset>
                <h2 class="fs-title">Personal Details</h2>
                <h3 class="fs-subtitle">Tell us something more about you</h3>
                <input type="text" name="fname" placeholder="First Name"/>
                <input type="text" name="lname" placeholder="Last Name"/>
                <input type="text" name="zipcode" placeholder="Zipcode" />


                <input type="button" name="next" class="next action-button" value="Next"/>
            </fieldset>

            <fieldset>
                <h2 class="fs-title">Add Vehicle</h2>
                <h3 class="fs-subtitle"></h3>

                <select name="car-years" id="car-years"></select>  
                <select name="car-makes" id="car-makes"></select> 
                <select name="car-models" id="car-models"></select>
                <select name="car-model-trims" id="car-model-trims"></select>  

                <input type="button" name="previous" class="previous action-button-previous" value="Previous"/>
                <input type="button" name="next" class="next action-button" value="Next"/>
            </fieldset>

            <fieldset>
                <h2 class="fs-title">Add Person</h2>
                <h3 class="fs-subtitle">Who do you want on the policy</h3>


                <input type="button" name="previous" class="previous action-button-previous" value="Previous"/>
                <input type="button" name="next" class="next action-button" value="Next"/>
            </fieldset>

            <fieldset>
                <h2 class="fs-title">Select Policy</h2>
                <h3 class="fs-subtitle">Choose your policy</h3>

                <input type="button" name="previous" class="previous action-button-previous" value="Previous"/>
                <input type="submit" name="submit" class="submit action-button" value="Submit"/>
            </fieldset>
        </form>
    </div>
</div>
<!-- /.MultiStep Form -->



    <script>
        $(document).ready(function () {
            //fieldsets
            var current_fs, next_fs, previous_fs;

            $(".next").click(function () {
                current_fs = $(this).parent();
                next_fs = $(this).parent().next();

                //activate next step on progressbar using the index of next_fs
                $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
                //$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

                next_fs.show();
                current_fs.hide();
            });

            $(".previous").click(function () {
                current_fs = $(this).parent();
                previous_fs = $(this).parent().prev();

                //activate prev step on progressbar using the index of prev_fs
                $("#progressbar li").eq($("fieldset").index(previous_fs)).addClass("active");
                $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

                previous_fs.show();
                current_fs.hide();
            });

            $(".submit").click(function () {
                return false;
            })

        });
    </script>

</body>
</html>
