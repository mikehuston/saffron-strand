var ImagePopup = {
  setup: function() {
    $('.item').mouseover(ImagePopup.getImageInfo);
  }
  ,getImageInfo: function() {
    $.ajax({type: 'GET',
            url: $(this).attr('href'),
            timeout: 5000,
            success: ImagePopup.showImageInfo,
            error: function(xhrObj, textStatus, exception) { alert('Error!'); }
            // 'success' and 'error' functions will be passed 3 args
           });
    return(false);
  }
  ,showImageInfo: function(data, requestStatus, xhrObject) {
    $('#displayImage').
      html(data).
      show();
    return(false);  // prevent default link action
  }
};
$(ImagePopup.setup);