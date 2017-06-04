$(function() {
    var $iosActionsheet = $('#iosActionsheet'),
        $iosMask = $('#iosMask'),
        $iosTip = $('#iosTip');
    function hideActionSheet() {
        $iosActionsheet.removeClass('weui-actionsheet_toggle');
        $iosTip.hide(200);
        $iosMask.hide(200);
    }
    $iosMask.on('click', hideActionSheet);
    $('#iosActionsheetCancel, #isoTipSure').on('click', hideActionSheet);
    $("#payAction").on("click", function() {
        $iosActionsheet.addClass('weui-actionsheet_toggle');
        $iosMask.show(200);
    });

    // 弹窗  即将开放
    $(".weui-icon-info-circle").on('click', function(){
        $iosTip.show(200);
        $iosMask.show(200);
    })

    // 下一步
    $(".weui-btn.nextstep").on('click', function(){
        // 先验证输入的数据是否完整

        $('.m-stepone').hide();
        // 然后显示详细信息
        $(".m-steplast").removeClass('hide')
    })

    // 返回修改
    $(".m-backedit").on('click', function(){
        $(".m-steplast").addClass('hide');
        $('.m-stepone').show(200);
    });

    // 提交信息
    $('.stepsubmit').on('click', function(){
        window.location.href = '/status:success';
    })

});
