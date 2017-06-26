$(document).on('turbolinks:load', function(){


  var modal = $('#myModal');

  var img = $('.img_modal');

  var modalImg = $('#img01');


  img.on('click', function(){

    modal.css("display","block");
    var nuevo = $(this).attr("src");

    modalImg.attr("src", nuevo);


  });

  var span = $('.close');
  span.on('click', function(){
    modal.css("display","none");


  });


  });
