$(function(){
  function buildHTML(comment){
    var html = 
      `
      <div class="one_comment">
        <div class="comment_user_name">
          ${comment.user_name}
        </div>
        <div class="one_comment_text">
          ${comment.text}
          <div class="comment_created_at">
            ${comment.created_at}
          </div>
        </div>
      </div>
      `
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments_index').prepend(html)
      $('.comment_text').val('');
      $('.form_submit').prop('disabled', false);
    })
    .fail(function(){
      alert('コメントを入力してください');
    })
  })
})