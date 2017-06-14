﻿$(document).ready(function () {
    $("#ProductId").empty();
    var productUrl = $("#productUrl").val();
    $("#ProductName").change(function () {
        $("#ProductId").empty();
        var productName = $("#ProductName").val();
        var json = { pName: productName };
        $.ajax({
            type: "POST",
            url: productUrl,
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(json),
            //product:JSON.parse(data),
            success: function (data) {
                // var product = JSON.parse(data);
                // alert("Wow");
                // alert(data);

                $("#ProductId").append('<option>Select</option');
                $.each(data, function (key, value) {
                    //alert(value.Id);
                    //alert(value.Model);
                    $("#ProductId").append('<option value=' + value.Id + '>' + value.Model + '</option>');

                });

            }, error: function (ts) {
                alert(ts.responseText);
            }
        });
    });
});