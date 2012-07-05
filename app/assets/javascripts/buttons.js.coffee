$(document).ready ->
  $(".button").each(make_button)

make_button = (index) ->
  $(this).mouseover ->
    $(this).addClass('button-down')
    $(this).removeClass('button')
  $(this).mouseout ->
    $(this).addClass('button')
    $(this).removeClass('button-down')