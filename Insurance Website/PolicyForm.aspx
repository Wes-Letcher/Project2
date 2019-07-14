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

            <!-- progressbar -->
            <ul id="progressbar">
                <li class="active">Personal Details</li>
                <li>Add Vehicle</li>
                <li>Add Person</li>
                <li>Select Policy</li>
            </ul>


                <input type="button" name="previous" class="previous action-button-previous" value="Previous"/>
                <input type="button" name="next" class="next action-button" value="Next"/>
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
