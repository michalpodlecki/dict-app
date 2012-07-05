# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  setup_input_field()
  setup_button()

construct_result = (data) ->
  return '<div class=\'result\'>' + data + '</div>';

render_results = (data) ->
  resultsSoFar = $('#results_area').html();
  $('#results_area').prepend(construct_result(data));
  $('.result:first').effect('highlight', {}, 1000);

setup_input_field = () ->
  field = $('#query_field')
  field.focusin ->
    if field.val() == 'Enter your query...'
      field.val ''
  field.focusout ->
    if field.val() == ''
      field.val 'Enter your query...'
  field.keypress (e) ->
    if e.which == 13
      run_search()

setup_button = () ->
  $('#search_button').click ->
    run_search()

request_count = 0

send_request = (service, query) ->
  $('#progress_display').removeClass('hidden')
  request_count++
  ajax_request =
    url: 'single/' + service + '/' + query
    success: render_results
    complete: end_request
  $.ajax(ajax_request)

end_request = () ->
  request_count--
  if request_count == 0
    $('#progress_display').addClass('hidden')

run_search = () ->
  request_count = 0
  $('#results_area').html ''
  query = $('#query_field').val()
  services = jQuery.parseJSON($('#services').text())
  send_request(service, query) for service in services
