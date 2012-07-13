# dict [![Build Status](https://secure.travis-ci.org/Ragnarson/dict-app.png?branch=master)](http://travis-ci.org/Ragnarson/dict-app)
Web frontend and API for dict.

## API
To get translations of `query` from all available dictionaries (JSON or HTML):

    http://hostname/?q=query

To get translation of `query` from one, selected `dictionary` (JSON or HTML):

    http://hostname/dictionary?q=query

To get a list of available dictionaries (JSON only):

    http://hostname/services/list
