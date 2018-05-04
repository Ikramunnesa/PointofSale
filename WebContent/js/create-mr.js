$(document).ready(function () {
    $("#ProductId").val('SELECT');
    $("#Quantity").val('');
    $("#UnitPrice").val('');
    $("#mrTr").hide();
    $("#serialTd").hide();
    var mrUrl = $("#mrUrl").val();
    var serialNos = [];
    $(".col-xs-2").keyup(function () {
        var quantity = $("#Quantity").val();
        var rowNo = 1;
        var supportString = createTextBox(quantity, rowNo);
        $("#srtr").empty();
        $("#srtr").append(createTextBox(quantity, rowNo));
        
    });

    $("#AddButton").click(function () {
        var valid = $("#MrForm").valid();
        if (valid) {
            $("#tableBody").empty();
            var rcvDate = $("#ReceiveDate").val();
            var supplier = $("#Supplier").val();
            var productId = $("#ProductId").val();
            var quantity = $("#Quantity").val();
            var unitPrice = $("#UnitPrice").val();
            $("#ProductId").val('');
            $("#Quantity").val('');
            $("#UnitPrice").val('');
            var previousInput;
            for (var i = 0; i < quantity; i++) {
                var serialNumber = 'SerialNo' + 1 + i;
                previousInput = $('[name^=' + serialNumber + ']');
                var sl = $('[name^=' + serialNumber + ']').val();
                serialNos.push(sl);
                previousInput.hide();
                //SERIAL NO IS READY TO BE PARSED TO THE CONTROLLER
            }
            var json = {
                ReceiveDate: rcvDate,
                Supplier: supplier,
                ProductId: productId,
                Quantity: quantity,
                UnitPrice: unitPrice,
                SerialNos:serialNos
            }
            $.ajax({
                type: "POST",
                url: mrUrl ,
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(json),
                success: function (data) {
                    serialNos = [];
                    $("#tableBody").show();
                    $.each(data, function (key, value) {
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