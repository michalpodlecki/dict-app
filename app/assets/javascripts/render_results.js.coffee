construct_result = (data) ->
  return '<div class=\'result\'>' + data + '</div>';

render_results = (data) ->
  resultsSoFar = $('#results_area').html();
  $('#results_area').prepend(construct_result(data));
  $('.result:first').effect('highlight', {}, 1000);
