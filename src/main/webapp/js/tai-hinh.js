/**
 * click image to browsing files
 */

$(document).ready(function() {
	$("#product-image").click(function() {
	    $("#img-file").focus().click();
	});
});

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#product-image').attr('src', e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
    }
}
