<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PolicyForm.aspx.cs" Inherits="Insurance_Website.PolicyForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
	<title>Revature Insurance</title>

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


    <form id="form1" runat="server">

    </form>
</body>
</html>
