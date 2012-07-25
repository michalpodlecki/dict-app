construct_result = (data) ->
  return "<div class=\"result\">#{data}</div>";

window.render_results = (data) ->
  $('#results-area').prepend(construct_result(data));
  $('.result:first').effect('highlight', {}, 1000);