# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  field = $('#query_field')
  field.focusin -> field.val ''
  field.keypress (e) ->
    if e.which == 13
      run_search()