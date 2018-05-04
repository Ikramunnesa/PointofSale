$(document).ready(function() {
    var date;
    var workOrderNo;
    var quantity;
    var rowNo;
    var serialtableId;
    var serialbodyId;
    var WorkOrderNo;
    var totalButton = 0;
   // var rowNo;
    var quantities = [];
    //var quantity;
    var models = [];
    var model;
    var serialNos = [];
    var remarks = [];
    $("#submit").hide();
    $("#WorkOrderNo").val('');

   
    

    var workOrderUrl = $("#workOrderUrl").val();
    var challanUrl = $("#challanUrl").val();

    $("#WorkOrderNo").change(function() {
        $("#tableBody").empty();
        $("#ContactPerson").val("");
        $("#CompanyName").val("");
        $("#Address").val("");
        $("#tablebody").empty();
        workOrderNo = $("#WorkOrderNo").val();
        var json = {
            workOrderId: workOrderNo
        };
        $.ajax({
            type: "POST",
            url: workOrderUrl,
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(json),
            //product:JSON.parse(data),
            success: function(data) {
                // $("#productTable").show();
                $("#tableBody").show();
                var count = 0;
                //$("#ContactPerson").val(data.)
                $.each(data, function(key, value) {
                    count++;
                    rowNo = count;
                    models.push(value.Model);
                    // models.push(value.Model);

                    $("#ContactPerson").val(value.ContactPerson);
                    $("#CompanyName").val(value.CompanyName);
                    $("#Address").val(value.Address);
                    $("#tableBody").append('<tr><td>' + '<input type="hidden" name="Model" value="' + value.Model
                        + '" />' + count + '</td>' + '<td>' +
                        '<table class="table table-condensed"><tr><td>' +
                        value.Product + '</td></tr>' +
                        '<tr><td>' +
                        value.Model + '</td></tr><tr><td><table id="serialTable'+rowNo+'"><tbody id="serialBody'+rowNo+'">' + createTextBox(value.Quantity,rowNo) + '</tbody></table></td></tr></table>' + '</td>' + '<td><input id="Quantity" name="Quantity'+rowNo+'" name="Quantity" class="form-control col-xs-4" value="' + value.Quantity + '" /></td>' +
                        '<td><input type="text" id="Remarks" name="Remarks'+rowNo+'" class="form-control" /> </td>' + '<td>' +
                        '<input type="button" id="AddButton' + rowNo + '" class="btn btn-default btn-info" value="Add"/>' + '</td>' +
                        '</tr>');
                });
                totalButton = count;
            }
        });
    });
   // var itemNo;
    //var quantityTextBoxId;

    $("table").on('input', ".col-xs-4", function() {
      var itemNo = this.name.match(/\d+/)[0];
       // serialtableId = 'serialTable' + itemNo;
        serialbodyId = 'serialBody' + itemNo;
       var quantityTextBoxId = 'Quantity' + itemNo;
        quantity = $('[name^=' + quantityTextBoxId + ']').val();
        $('[id^=' + serialbodyId + ']').empty();
        $('[id^=' + serialbodyId + ']').append(createTextBox(quantity,itemNo));
    });



    $("body").on("click", ".btn-info", function () {
        date = $("#Date").val();
        var itemNo = this.id.match(/\d+/)[0];
        var quantityTextBoxId = 'Quantity' + itemNo;
        quantity = $('[name^=' + quantityTextBoxId + ']').val();
        var workOrderNo = $("#WorkOrderNo").val();
        quantity = $('[name^=' + quantityTextBoxId + ']').val();
        var valid = $("#challanForm").valid();
        if (valid) {
            
            
            //var itemNo = this.id.match(/\d+/)[0];
           
            remarks = $('[name^="Remarks'+itemNo+'"]').val();
            this.style.display = 'none';
            if (itemNo == totalButton) {
                $("#submit").show();
            }
            //model is ready to be parsed to controller
            model = models[itemNo - 1];
          //  quantity = quantities[itemNo - 1];
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
                WorkOrderNo: workOrderNo,
                Quantity:quantity,
                Remarks: remarks
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