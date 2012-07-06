# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  setup_input_field()
  setup_button()
  $('#progress_display').ajaxStop ->
    $(this).addClass 'hidden'
  bind_back_button()

bind_back_button = () ->
  $(window).bind 'popstate', ->
    query = location.pathname.split("/").pop()
    $('#query_field').val decodeURIComponent(query)
    execute_search()

construct_result = (data) ->
  return '<div class=\'result\'>' + data + '</div>';

render_results = (data) ->
  resultsSoFar = $('#results_area').html();
  $('#results_area').prepend(construct_result(data));
  $('.result:first').effect('highlight', {}, 1000);
window.render_results = render_results

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

push_url = () ->
  pageurl = $('#query_field').val()
  window.history.pushState({path:pageurl},'',pageurl);

run_search = () ->
  push_url()
  execute_search()

execute_search = () ->
  query = $('#query_field').val()
  if query == ''
    return

  document.title = 'dict - ' + query
  $('#results_area').html ''
  $('#progress_display').removeClass('hidden')
  services = jQuery.parseJSON($('#services').text())
  $.getScript('/single/' + service + '/' + query) for service in services
