# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  if $('#results-area').length
    setup_input_field()
    setup_button()
    $('#progress-display').ajaxStop ->
      $(this).addClass 'hidden'
    bind_back_button()
    copy_query_to_field()
    execute_search()

copy_query_to_field = () ->
  query = window.get_param("q")
  $('#query-field').val decodeURIComponent(query)

bind_back_button = () ->
  $(window).bind 'popstate', ->
    field_value = $('#query-field').val()
    copy_query_to_field()
    if field_value != $('#query-field').val()
      execute_search()

construct_result = (data) ->
  return '<div class=\'result\'>' + data + '</div>';

render_results = (data) ->
  $('#results-area').prepend(construct_result(data));
  $('.result:first').effect('highlight', {}, 1000);
window.render_results = render_results

setup_input_field = () ->
  field = $('#query-field')
  field.focus()
  field.keypress (e) ->
    if e.which == 13
      run_search()

setup_button = () ->
  $('#search-button').click ->
    run_search()

push_url = () ->
  pageurl = '?q=' + $('#query-field').val()
  window.history.pushState({path:pageurl},'',pageurl);

run_search = () ->
  query = $('#query-field').val()
  if $.trim(query) == ''
    return

  push_url()
  execute_search()

make_fail_callback = (service) ->
  () ->
    window.show_error('Unable to receive translations from ' + service)

execute_search = () ->
  query = $('#query-field').val()
  if $.trim(query) == ''
    return

  document.title = 'Dicteo - ' + query
  $('#results-area').html ''
  $('#progress-display').removeClass('hidden')
  services = jQuery.parseJSON($('#services').text())
  $.getScript('dictionaries/' + service + '?q=' + query).fail(make_fail_callback(service)) for service in services
