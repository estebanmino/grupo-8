

$(document).on('turbolinks:load', function(){

  $('.nav-link').on('click', function(){

    var btn = $(this);

    //get all elements with navbar class and remove the active class
    $('.nav-link').each(function(){
      $(this).removeClass('active');

    });
    //set active class to the current btn

    btn.addClass('active');


});

//default behavior
$('.defaultClick').click();
});
