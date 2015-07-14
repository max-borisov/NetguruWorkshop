$ ->
  $('div.raty').raty
    readOnly: true
    # path: '/assets'
    number: ->
      $(@).attr('data-number')
    score: ->
      $(@).attr('data-score')