


$(document).ready(function () {

    $.validator.addMethod("CheckDropDownList", function (value, element) {
        if (value == '')
            return false;
        else
            return true;
    });

    //MultiSelect
    $(".js-source-states-2").select2();

    $.validator.addMethod("exists", function (value, element) {
        var status = true;
        $.ajax({
            async: false,
            type: 'POST',
            url: '@Url.Action("CheckUsernameExists", "Account")',
            dataType: 'json',
            data: { Username: value },
            success: function (response) {
                //$("#emailcheckresults").text(response);

                if (response == false) {
                    status = response;
                }
            }
        });
        return this.optional(element) || status == true;
    }, "(Username already exists.)");


    $.validator.addMethod("match", function (value, element) {
        return this.optional(element) || /^[\w-]+(?:\.[\w-]+)*@@(?:[\w-]+\.)+[a-zA-Z]{2,7}$/i.test(value);
    }, "(Please enter a valid email address.)");


});