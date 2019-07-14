function UpdateButtonItems() {
    $.ajax({
        type: "POST",
        url: 'ClaimForm.aspx/Button1_Click',
        data: "",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (msg) {
            $("#divResult").html("success");
        },
        error: function (e) {
            $("#divResult").html("Something Wrong.");
        }
    });
}