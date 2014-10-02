$(document).ready(function() {
  $('input[name=done]').hide();
  $('.cues').hide();
  $('.lines').hide();



  $('.begin').on('click', function(){
    $('.cues:first').show();
    $('.begin').remove();
  });

  $('.show_line').on("click", function(){
    var num = 1;

    var test = $('li.lines').find('li.lines').eq(1);
    test.show();
    // $('.lines').find("li:nth-child("+ num+1 +")").show();
    // $('.show_line').remove();
    // $('.show_cue').show();
  });

  $('.cue_lines').on("mouseenter", function(){
    $('.show_line').show();
  });

  $('input[name=complete]').on('mouseover',function(){
    $('input[name=done]').show();

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
