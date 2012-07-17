window.get_param = (name) ->
  name = name.replace(/[\[]/, '\\\[').replace(/[\]]/, '\\\]')
  regexS = '[\\?&]' + name + '=([^&#]*)'
  regex = new RegExp(regexS)
  results = regex.exec(window.location.search)
  if results == null
    return ''
  else
    return decodeURIComponent(results[1].replace(/\+/g, ' '))
