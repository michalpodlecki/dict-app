window.ajax_requests = []
window.ajax_requests.abort_all = ->
  original_show_error = window.show_error
  window.show_error = () ->
  $.each this, (idx, request) ->
    request.abort()
  window.show_error = original_show_error
  ajax_requests.length = 0