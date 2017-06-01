// ios
$(function() {
    var $iosActionsheet = $('#iosActionsheet');
    var $iosMask = $('#iosMask');
    function hideActionSheet() {
        $iosActionsheet.removeClass('weui-actionsheet_toggle');
        $iosMask.hide(200);
    }
    $iosMask.on('click', hideActionSheet);
    $('#iosActionsheetCancel').on('click', hideActionSheet);
    $("#payAction").on("click", function() {
        $iosActionsheet.addClass('weui-actionsheet_toggle');
        $iosMask.show(200);
    });

    $(".m-steplast").hide(200);
});
