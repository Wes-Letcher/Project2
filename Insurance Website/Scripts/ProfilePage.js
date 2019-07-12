$(document).ready(function () {
    //fieldsets
    var current_stage, next_stage, previous_stage;

    $(".next").click(function () {
        //button gets its parent
        current_stage = $(this).parent();
        next_stage = $(this).parent().next();

        //activate next step on progressbar using the index of next_fs
        $("#progressbar li").eq($(".policy_stage").index(next_stage)).addClass("active");

        next_stage.show();
        current_stage.hide();
    });

    $(".previous").click(function () {
        current_stage = $(this).parent();
        previous_stage = $(this).parent().prev();

        //activate prev step on progressbar using the index of prev_stage
        $("#progressbar li").eq($(".policy_stage").index(previous_stage)).addClass("active");
        $("#progressbar li").eq($(".policy_stage").index(current_stage)).removeClass("active");

        previous_stage.show();
        current_stage.hide();
    });

    $(".submit").click(function () {
        return false;
    })

});