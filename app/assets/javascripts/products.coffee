$ ->
  $('div.raty').raty
    readOnly: true
    number: ->
      $(@).attr('data-number')
    score: ->
      $(@).attr('data-score')