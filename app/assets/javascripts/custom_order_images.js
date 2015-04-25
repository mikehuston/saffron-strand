var ImagePopup = {
  setup: function() {
    // add hidden 'div' to end of page to display popup:
    // var popupDiv = $('<div id="itemInfo" style="padding: 2ex; position: absolute; border: 2px double grey; backgroud: wheat;"></div>');
    // popupDiv.hide().appendTo($('body'));
    // $('span').click(ImagePopup.getImageInfo);
    // $('span').mouseenter(ImagePopup.getImageInfo);
    $('.item').mouseover(ImagePopup.getImageInfo);
    // $('#closeLink').click(ImagePopup.hideImageInfo);
  }
  ,getImageInfo: function() {
    console.log("HELLO");
    console.log($(this));
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
    // center a floater 1/2 as wide and 1/4 as tall as screen
    // var oneFourth = Math.ceil($(window).width() / 4);
    $('#displayImage').
      html(data).
      show();
    // make the Close link in the hidden element work
    $('#closeLink').click(ImagePopup.hideImageInfo);
    return(false);  // prevent default link action
  }
  // ,hideImageInfo: function() {
  //   $('#itemInfo').hide();
  //   return(false);
  // }
};
$(ImagePopup.setup);