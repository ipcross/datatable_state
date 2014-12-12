datatableStateLoad = function() {
  var o;
  try {
    $.ajax({
      "url": "/datatable_states/store/load",
      "data": { datatable_state: {
         path: location.pathname.replace(/^.*\//, '') }
      },
      "async": false,
      "dataType": "json",
      "success": function (json) {
        o = json;
      }
    });
    this.loadedState = o;
    return o;
  } catch (e) {
  }
}

datatableStateSave = function(settings, data) {
  try {
    var loadedState = jQuery.extend({}, this.loadedState);
    var savingState = jQuery.extend({}, data);
    delete loadedState["time"];
    delete savingState["time"];
    // don't save unmodified state
    if (JSON.stringify(savingState) === JSON.stringify(loadedState)) {
      return false;
    }
    $.ajax({
      "url": "/datatable_states/store/save",
      "data": { datatable_state: {
          path: location.pathname.replace(/^.*\//, ''),
          state: JSON.stringify(data) }
      },
      "dataType": "json",
      "method": "POST",
      "success": function () {
      }
    });
  } catch (e) {
  }
}

datatableStateDefaultPageLength = function() {
  var table = $('.datatable');
  if (table.data('displayLength')) {
    return table.data('displayLength');
  } else if (table.hasClass('datatable_ajax')) {
    return 100;
  } else {
    return -1;
  }
}

datatableStateSkipPerColumn = function(settings, data) {
  $.each(data["columns"], function(i, column) {
    column["search"]["search"] = "";
  });
}
