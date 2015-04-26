var MenuPopup = {
  setup: function() {
    // add hidden 'div' to end of page to display popup:
    // var popupDiv = $('<div id="menuInfo" style="padding: 2ex; position: absolute; border: 2px double grey; backgroud: wheat;"></div>');
    // popupDiv.hide().appendTo($('body'));
    $('#event_budget_per_person').change(MenuPopup.getMenuInfo);
    $('#event_budget_per_person').trigger('change');
  }
  ,getMenuInfo: function() {
    $.ajax({type: 'GET',
            url: '/menus/structure/' + $(this).val(),
            timeout: 5000,
            success: MenuPopup.showMenuInfo,
            error: function(xhrObj, textStatus, exception) { alert('Error!'); }
            // 'success' and 'error' functions will be passed 3 args
           });
    return(false);
  }
  ,showMenuInfo: function(data, requestStatus, xhrObject) {
    // center a floater 1/2 as wide and 1/4 as tall as screen
    var oneFourth = Math.ceil($(window).width() / 4);
    $('#menuDisplay').
      html(data).
      show();
    // make the Close link in the hidden element work
    // $('#closeLink').click(MenuPopup.hideMenuInfo);
    return(false);  // prevent default link action
  }
  // ,hideMenuInfo: function() {
  //   $('#menuInfo').hide();
  //   return(false);
  // }
};
$(MenuPopup.setup);