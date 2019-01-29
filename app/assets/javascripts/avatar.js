function readURL(input) {
  $("#avatar_for_user_edit").hide();
  $("#change_avatar_for_user_edit").show();
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function(e) {
      $("#img_prev")
        .attr("src", e.target.result)
        .width(100)
        .height(100);
    };

    reader.readAsDataURL(input.files[0]);
  }
}
