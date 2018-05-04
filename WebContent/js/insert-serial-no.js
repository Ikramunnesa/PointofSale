$(document).ready(function() {
    $("#ProductId").val('');
    $("#Quantity").val('');
    $("#UnitPrice").val('');
    $("#mrTr").hide();
    var quantity;
    var serialNos = [];
    var inputId;
    $("#Quantity").change(function() {
        alert("Changed");
        quantity = $("#Quantity").val();
        $("#SerialNoDiv").style = "margin:0 auto; max-width:400px";
        $("#SerialNoDiv").show();
        // $("#SerialNoDiv").style(zIndex = +5);
        for (var i = 0; i < quantity; i++) {
            $("#SerialBody").append('<tr><td><input id="SerialNo[' + i + ']"/></td></tr>');
           // inputId = "SerialNo[" + i + "]";
            // serialNos.push($(inputId).val());
        }

    });

    $("#AddButton").click(function() {
       // quantity = $("#Quantity").val();
        var valid = $("#MrForm").valid();
        if (valid) {
            for (var j = 1; j <= quantity; j++) {
                inputId = "SerialNo[" + j + "]";
                //var serialtextbox = '"' + inputId + ')';
                $('"#'+inputId+'"').change(function() {
                    var serial = $('"#' + inputId + '"').val();
                    alert($(serial).val);
                    serialNos.push($(serial).val());

                });
            }
            $("#tableBody").empty();
            var rcvDate = $("#ReceiveDate").val();
            var supplier = $("#Supplier").val();
            var productId = $("#ProductId").val();
            //var quantity = $("#Quantity").val();
            var unitPrice = $("#UnitPrice").val();
            $("#ProductId").val('');
            $("#Quantity").val('');
            $("#UnitPrice").val('');
            var json = {
                ReceiveDate: rcvDate,
                Supplier: supplier,
                ProductId: productId,
                Quantity: quantity,
                UnitPrice: unitPrice,
                SeialNos: serialNos

            }
            $.ajax({
                type: "POST",
                url: '@Url.Action("Receive", "MR")',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(json),
                success: function(data) {

                    $("#tableBody").show();
                    $.each(data, function(key, value) {
                        var rawDate = value.ReceiveDate;
                        var epochDate = rawDate.substring(6, rawDate.length - 2);
                        //alert(rawDate);
                        // alert(epochDate);
                        var myDate = new Date(epochDate * 1);

                        //$("#tableBody").append('<tr><td>' + myDate.toLocaleDateString() + '</td><td>' + value.Supplier + '</td><td>' + value.Model + '</td><td>' + value.Quantity + '</td><td>' + value.UnitPrice + '</td></tr>');
                        $("#tableBody").append('<tr><td>' + value.Name + '</td><td>' + value.Model + '</td><td>' + value.Quantity + '</td><td>' + value.UnitPrice + '</td></tr>');

                    });


                }
            });
        }
    });

});