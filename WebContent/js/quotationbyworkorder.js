$(document).ready(function () {
    $("#submit").hide();
    var date;
    $("#WorkOrderNo").val('');
    var WorkOrderNo;
    var totalButton = 0;
    var rowNo;
    var quantities = [];
    var quantity;
    var models = [];
    var model;
    var serialNos = [];
    var remarks = [];
    function createTextBox(number) {
        var supportString = "";
        for (var i = 0; i < number; i++) {
            supportString += '<td><input id="SerialNo' + rowNo + i + ' " name="SerialNo' + rowNo + i + ' " class="form-control btn-default" placeholder="Serial No" /></td>';
        }
        return supportString;
    }

    var workOrderUrl = $("#workOrderUrl").val();
    var challanUrl = $("#challanUrl").val();
    $("#WorkOrderNo").change(function () {
        //$("#productTable").empty();
        $("#tableBody").empty();
        $("#ContactPerson").val("");
        $("#CompanyName").val("");
        $("#Address").val("");
        $("#tablebody").empty();
        var workOrderNo = $("#WorkOrderNo").val();
        WorkOrderNo = workOrderNo;
        var json =
        {
            workOrderId: workOrderNo
        };
        $.ajax({
            type: "POST",
            url: workOrderUrl,
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(json),
            //product:JSON.parse(data),
            success: function (data) {
                // $("#productTable").show();
                $("#tableBody").show();
                var count = 0;
                //$("#ContactPerson").val(data.)
                $.each(data, function (key, value) {
                    count++;
                    rowNo = count;
                    models.push(value.Model);
                    quantities.push(value.Quantity);
                    $("#ContactPerson").val(value.ContactPerson);
                    $("#CompanyName").val(value.CompanyName);
                    $("#Address").val(value.Address);

                    $("#tableBody").append('<tr><td><input type="hidden" name="Model" value="' + value.Model
                        + '" />' + count + '</td><td><table><tr><td>' + value.Product + '</td></tr><tr><td>'
                        + value.Model + '</td></tr><tr>' + createTextBox(value.Quantity) + '</tr></table></td><td>'
                        + value.Quantity + '</td><td>' + '<input name="Remarks" class="form-control" />'
                        + '</td><td><input type="button" id="AddButton[' + count
                        + ']" class="btn btn-info" value="Add" ></td></tr>');


                });

                totalButton = count;


            }

        });
    });

    $("body").on("click", ".btn-info", function () {
        date = $("#Date").val();
        var valid = $("#challanForm").valid();
        if (valid) {

            var workOrderNo = WorkOrderNo;
            var itemNo = this.id.match(/\d+/)[0];
            this.style.display = 'none';
            if (itemNo==totalButton) {
                $("#submit").show();
            }
            //model is ready to be parsed to controller
            model = models[itemNo - 1];
            quantity = quantities[itemNo - 1];
            //testing
            var previousInput;
            for (var i = 0; i < quantity; i++) {
                var serialNumber = 'SerialNo' + itemNo + i;
                previousInput = $('[name^=' + serialNumber + ']');
                var sl = $('[name^=' + serialNumber + ']').val();
                serialNos.push(sl);
                previousInput.hide();
                //SERIAL NO IS READY TO BE PARSED TO THE CONTROLLER
            }
            var json = {
                Date: date,
                SerialNos: serialNos,
                model: model,
                WorkOrderNo: WorkOrderNo
            };

            $.ajax({
                type: "POST",
                url: challanUrl,
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(json),
                //product:JSON.parse(data),
                success: function (data) {

                    serialNos = [];
                    //alert("parsing successfull");
                    $.each(data, function (key, value) {

                    });

                },
                error: function (ts) {
                    alert(ts.responseText);
                }
            });
        }
    });

});