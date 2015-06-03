// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  
  $('div.raty').raty({
    readOnly: true,    
    path: '/assets',
    number: function() {
      return $(this).attr('data-number');
    },
    score: function() {
      return $(this).attr('data-score');
    }
  })

})