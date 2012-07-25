# dict [![Build Status](https://secure.travis-ci.org/Ragnarson/dict-app.png?branch=master)](http://travis-ci.org/Ragnarson/dict-app)
Web frontend and API for [dict](http://dicteo.pl/).

## API
### HTML
To get translations of `query` from all available dictionaries (JSON or HTML):

    http://hostname/?q=query

To get translation of `query` from one, selected dictionary (e.g. wiktionary) (JSON or HTML):

    http://hostname/dictionaries/wiktionary?q=query

To get a list of available dictionaries (JSON only):

    http://hostname/dictionaries/list

### JSON
`curl -v -H "Accept: application/json" -H "Content-Type: application/json" -X POST http://dicteo.pl/?q=dziewica`
`curl -v -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://dicteo.pl/dictionaries/glosbe?q=dziewica`
`curl -v -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://dicteo.pl/dictionaries/wiktionary?q=dziewica`
`curl -v -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://dicteo.pl/dictionaries`

## People

### Trainees
- [Jan Borwin](https://github.com/janiuuuu)
- [Mateusz Czerwiński](https://github.com/mrfustrr)
- [Kosma Dunikowski](https://github.com/kdunee)
- [Aleksander Gozdek](https://github.com/alexgozdek)
- [Rafał Ośko](https://github.com/rekosko)
- [Michał Podlecki](https://github.com/michalpodlecki)

### Mentors
- [Grzegorz Kołodziejczyk](https://github.com/grk)
- [Michał Kwiatkowski](https://github.com/mkwiatkowski)

## Made during internship at [Ragnarson](http://ragnarson.com/)

## Hosted by [Shelly Cloud](https://shellycloud.com/)
