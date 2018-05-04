function createTextBox(number, rowNumber) {
    var supportString = "";
    if (number <= 3 && number > 0) {
        for (var i = 0; i < number; i++) {
            supportString += '<td><input name="SerialNo' + rowNumber + i + '" id="SerialNo' + rowNumber + i + '" class="form-control col-xs-2" placeholder="Serial No" />' + '</td>';
        }
        supportString = '<tr id="row' + rowNumber + '">' + supportString + '</tr>';
    } else if (number > 3) {
        var quotient = Math.floor(number / 3);
        var remainder = number % 3;
        var max=0;
        var textboxString1 = "", textboxString2 = "";
        //var l = 0;
        for (var j = 0; j < quotient; j++) {

            for (var l = 0; l < 3; l++) {
                if (j > 0) {
                    max = j + 2 * j + l;
                    textboxString1 += '<td><input name="SerialNo' + rowNumber + max.toString() + '" id="SerialNo' + rowNumber + max.toString() + '" class="form-control col-xs-2" placeholder="Serial No"/></td>';
                } else {
                    max = j + l;
                    textboxString1 += '<td><input name="SerialNo' + rowNumber + max.toString() + '" id="SerialNo' + rowNumber + max.toString() + '" class="form-control col-xs-2" placeholder="Serial No"/></td>';
                }


            }
            textboxString1 = '<tr>' + textboxString1 + '</tr>';
        }
        for (var k = 0; k < remainder; k++) {
            textboxString2 += '<td><input name="SerialNo' + rowNumber + (max + 1 + k).toString() + '" id="SerialNo' + rowNumber + (max + 1 + k).toString() + '" class="form-control col-xs-2" placeholder="Serial No" />' + '</td>';
        }
        supportString = textboxString1 + '<tr>' + textboxString2 + '</tr>';
    }
    return supportString;
}