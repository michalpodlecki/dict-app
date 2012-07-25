# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.at_search_page = ->
  $('#results-area').length

get_field_value = ->
  $('#query-field').val()

is_query_valid = (query) ->
  $.trim(query) != ''

$(document).ready ->
  if at_search_page()
    setup_input_field()
    setup_ajax()
    bind_back_button()
    copy_query_to_field()

    query = get_field_value()
    if is_query_valid(query)
      execute_search(get_field_value())

setup_input_field = ->
  $('#query-field').focus()

setup_ajax = ->
  $('#progress-display').ajaxStop ->
    $(this).addClass 'hidden'
  $.ajaxSetup( { cache: true } )

bind_back_button = ->
  $(window).bind 'popstate', ->
    field_value = get_field_value()
    copy_query_to_field()

    query = get_field_value()
    if field_value != query
      execute_search(query)

copy_query_to_field = ->
  query = window.get_param('q')
  $('#query-field').val decodeURIComponent(query)

push_url = (query) ->
  if not is_query_valid(query)
    return

  pageurl = "?q=#{query}"
  window.history.pushState({path:pageurl},'',pageurl)

  if typeof _gauges isnt 'undefined'
    _gauges.push(['track'])

window.run_search = (query) ->
  push_url(query)
  execute_search(query)

make_fail_callback = (service) ->
  () ->
    show_error("Nie można uzyskać tłumaczeń z #{service}")

clear_previous_search = ->
  ajax_requests.abort_all()
  $('#results-area').html ''

execute_search = (query) ->
  if not is_query_valid(query)
    return

  clear_previous_search()

  $('#progress-display').removeClass('hidden')

  document.title = "Dicteo - #{query}"
  services = jQuery.parseJSON($('#services').text())
  ajax_requests.push($.getScript("/dictionaries/#{service}.js?q=#{query}").fail(make_fail_callback(service))) for service in services
