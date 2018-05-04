$(document).ready(function () {
    $("#ProductId").val('');
    $("#Quantity").val('');
    $("#UnitPrice").val('');
    //$("#mrTr").hide();
    
    var createUrl = $("#createUrl").val();
    $('#inputHead').hide();
    

        $("#AddButton").click(function() {
            var isValid = $("#quotationForm").valid();
           
            if (isValid) 
            {
                $("#tableBody").empty();
                var contactPerson = $("#ContactPerson").val();
                var companyName = $("#CompanyName").val();
                var address = $("#Address").val();
                var date = $("#Date").val();
                var catId = $("#CategoryId").val();
                var subCatId = $("#SubCategoryId").val();
                var typeId = $("#TypeId").val();
                var productId = $("#ProductId").val();
                var quantity = $("#Quantity").val();
                var unitPrice = $("#UnitPrice").val();
                var subject = $("#Subject").val();
                $("#ProductId").val('');
                $("#Quantity").val('');
                $("#UnitPrice").val('');
                var json = {
                    ContactPerson: contactPerson,
                    CompanyName: companyName,
                    Address: address,
                    Date: date,
                    Subject:subject,
                    CategoryId: catId,
                    SubCategoryId: subCatId,
                    TypeId: typeId,
                    ProductId: productId,
                    Quantity: quantity,
                    UnitPrice: unitPrice
                }
                $.ajax({
                    type: "POST",
                    url: createUrl,
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(json),
                    success: function(data) {
                        $("#inputHead").show();

                        $("#tableBody").show();
                       
                        $.each(data, function(key, value) {
                            i = key;
                            
                            $("#tableBody").append('<tr><td><input type="hidden" id="Id" name="Id" value="' + value.Id + '"/>' + value.Product + '</td><td>' + value.Model + '</td><td>' + value.Quantity + '</td><td>' + value.UnitPrice + '</td><td>' + value.Total + '</td></tr>');
                            
                            });


                    }
                });
            }
    });
   
});