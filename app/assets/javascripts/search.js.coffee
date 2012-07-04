# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  setup_input_field()
  setup_button()

setup_input_field = () ->
  field = $('#query_field')
  field.focusin -> field.val ''
  field.focusout ->
    if field.val() == ''
      field.val 'Enter your query...'
  field.keypress (e) ->
    if e.which == 13
      run_search()

setup_button = () ->
  $('#search_button').click ->
    run_search()

run_search = () ->
  query = $('#query_field').val()
  window.location.href = "/" + query