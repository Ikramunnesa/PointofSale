$(document).ready(function() {
    $("#ProductId").val("");
    $("#Quantity").val("");
    var createUrl = $("#createUrl").val();
    $("#inputHead").hide();
    $("#requisitionViewDiv").hide();

    $("#AddButton").click(function() {
        var i = $("#requisitionForm").valid();
        if (i) {
            $("#tableBody").empty();

        var date = $("#Date").val();
        var project = $("#Project").val();
        var productId = $("#ProductId").val();
        var quantity = $("#Quantity").val();
        var remarks = $("#Remarks").val();


        var json = {
            Date: date,
            Project: project,
            ProductId: productId,
            Quantity: quantity,
            Remarks: remarks

        }

        $.ajax({
            type: "POST",
            url: createUrl,
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(json),
            success: function(data) {
                $("#inputHead").show();
                $("#requisitionViewDiv").show();
                $("#tableBody").show();

                $.each(data, function(key, value) {
                    i = key;
                    // $("#projectDiv").append("<label>"+value.Project+"</label>");


                    $("#tableBody").append('<tr><td>' + value.Project + '</td><td>' + value.Product + '</td><td>' + value.Model + '</td><td>' + value.Quantity + '</td><td>' + value.Remarks + '</td></tr>');


                });


            }
        });
    }
    });
});