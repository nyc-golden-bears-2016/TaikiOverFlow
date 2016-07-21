$(document).ready(function() {


  $('#comment-form').submit(function(event){
      event.preventDefault();

    $.ajax({
        url: $(this).attr('action'),
        method: $(this).attr('method')
    }).done(function(response))





    })


});
