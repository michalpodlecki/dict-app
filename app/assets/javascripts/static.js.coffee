# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  if !($('#results-area').length)
    $('#query-field').keypress (e) ->
      if e.which == 13
        redirect()
    $('#search-button').click ->
      redirect()

redirect = () ->
  field = $('#query-field')
  query = field.val()
  window.location = '/?q=' + query
