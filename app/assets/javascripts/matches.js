// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load', function(){

  var teams = $('#match_home_team_id').html();

  var tournaments = $('#match_tournament_id');

  tournaments.on('change', function(){

    tournament = $('#match_tournament_id').find(':selected').text();

    var options = $(teams).filter('optgroup[label="' +tournament+'"]').html();
    
    if (options) {
      $('#match_home_team_id').html(options);
      $('#match_visit_team_id').html(options);

    }
    else {
      $('#match_home_team_id').empty();
    }



  })

  });
