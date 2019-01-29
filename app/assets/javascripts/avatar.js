var _validFileExtensions = [".jpg", ".jpeg", ".bmp", ".gif", ".png"];
function Validate(oForm) {
  if (oForm.type == "file") {
    var sFileName = oForm.value;
    if (sFileName.length > 0) {
      var blnValid = false;
      for (var j = 0; j < _validFileExtensions.length; j++) {
        var sCurExtension = _validFileExtensions[j];
        if (
          sFileName
            .substr(
              sFileName.length - sCurExtension.length,
              sCurExtension.length
            )
            .toLowerCase() == sCurExtension.toLowerCase()
        ) {
          blnValid = true;
          break;
        }
      }
      if (!blnValid) {
        alert(
          "Sorry, " +
            sFileName +
            " is invalid, allowed extensions are: " +
            _validFileExtensions.join(", ")
        );
        return false;
      }

      $("#avatar_for_user_edit").hide();
      $("#change_avatar_for_user_edit").show();
      if (oForm.files && oForm.files[0]) {
        var reader = new FileReader();

        reader.onload = function(e) {
          $("#img_prev")
            .attr("src", e.target.result)
            .width(100)
            .height(100);
        };

        reader.readAsDataURL(oForm.files[0]);
      }
    }
  }

  return true;
}
