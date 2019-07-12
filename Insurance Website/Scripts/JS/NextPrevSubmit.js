$(document).ready(
    function () {
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
    }
);