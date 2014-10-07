$(document).ready(function() {
  $('input[name=done]').hide();
  // $('.cues').hide();
  // $('.lines').hide();

  // $('.begin').on('click', function(){
  //   $('.cues:first').show();
  //   $('.begin').remove();
  // });

  // $('.show_line').on("click", function(){
  //   var i = 0;
  //   $('li.lines').eq(i++).show();
  //   $(this).remove();
  //   $('.show_next').show();
  // });

  // $('.show_next').on("click", function(){
  //   var i = 0;
  //   $('li.cues').eq(i++).show();
  //   $(this).remove();
  //   $('.show_line').show();
  // });



  // $('.cue_lines').on("mouseenter", function(){
  //   $('.show_line').show();
  // });

  // $('input[name=complete]').on('mouseover',function(){
  //   $('input[name=done]').show();

  // $('input[name=done]').on('click', function() {
  //   $('form[id=add-lines]').append("<a href=/users>Home</a>");
  // });

  $('form[id=add-lines]').on('submit', function(event){
    event.preventDefault();

    $.ajax({
      url: $(this).attr("action"),
      data: $(this).serialize(),
      method: "POST",
    }).done(function(response){
      $('form[id=add-lines]').each(function(){
        this.reset();
      });
     });
  });

});
});
