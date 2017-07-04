// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('turbolinks:load', function(){

  var tournaments = $('#tournament_tournament_id').html();

  var divisions = $('#team_division_id');

  divisions.on('change', function(){

    division = $('#team_division_id').find(':selected').text();

    var options = $(tournaments).filter('optgroup[label="' +division+'"]').html();
    
    if (options) {
      $('#tournament_tournament_id').html(options);


    }
    else {
      $('#tournament_tournament_id').empty();
    }



  })

  });
