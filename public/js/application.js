$(document).ready(function() {
	$('#question_arrow-up').click(function(event){
		event.preventDefault();

  var question_id = $(this).prev().val();

	//ここをなんとかしてquestion_idを取得させる

		var request = $.ajax({
      method: 'POST',
      url: '/questions/votes/'+question_id,
      data: {uservote: "upvote"}
    });//.done(function(response){
      // $('#die-container').html("<div class=\"die\"> <span class=\"roll\">"+response+"</span> </div>")
      //$('#question_votes').html(response);
      //      });
      request.done(function(response){
      	// alert('request done');
			$('#question_votes').html(response);

      });

	});
});
