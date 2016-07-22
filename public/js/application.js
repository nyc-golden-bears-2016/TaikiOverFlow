$(function() {

  // comment boxes hide and show
  var $comment_form = $('.col-group #comment-form');
  $comment_form.each(function(){
    var $comment_form = $(this).children("#comment_form")
    var $comment_button = $(this).children(".comment-btn");
    $(this).after('<span class="comment-btn">Leave a comment</span>');
    $(this).hide();

  });

  $comment_button = $(".comment-btn")
  $comment_button.on('click',function(){
    $(this).prev($comment_form).show();
    $(this).hide();
  })

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

});
