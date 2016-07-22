$(document).ready(function() {
	$('#question_arrow-up').click(function(event){
		event.preventDefault();
	  var question_id = $(this).prev().val();

		var request = $.ajax({
	    method: 'POST',
	    url: '/questions/votes/'+question_id,
	    data: {uservote: "upvote"}
	  });
		request.done(function(response){
			$('#question_votes').html(response);
		});
	});

	$('#question_arrow-down').click(function(event){
		event.preventDefault();
	  var question_id = $(this).prev().val();
		var request = $.ajax({
	    method: 'POST',
	    url: '/questions/votes/'+question_id,
	    data: {uservote: "downvote"}
	  });
		request.done(function(response){
			$('#question_votes').html(response);
		});
	});

	$('[id^=answer_arrow-up]').click(function(event){
		event.preventDefault();
	  var answer_id = $(this).prev().val();
		var request = $.ajax({
	    method: 'POST',
	    url: '/answers/votes/'+answer_id,
	    data: {uservote: "upvote"}
	  });
		request.done(function(response){
			$('#answer_votes_'+answer_id).html(response);
		});
	});

	$('[id^=answer_arrow-down]').click(function(event){
		event.preventDefault();
	  var answer_id = $(this).prev().val();
		var request = $.ajax({
	    method: 'POST',
	    url: '/answers/votes/'+answer_id,
	    data: {uservote: "downvote"}
	  });
		request.done(function(response){
			$('#answer_votes_'+answer_id).html(response);
		});
	});


});
