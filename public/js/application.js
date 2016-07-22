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

  // $('#comment-form').submit(function(event){
  //     event.preventDefault();
  //
  //   $.ajax({
  //       url: $(this).attr('action'),
  //       method: $(this).attr('method')
  //   }).done(function(response))
  //
  //
  //   })


});
