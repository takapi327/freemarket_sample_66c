$(function(){

  var dataBox = new DataTransfer();

  var file_box = document.querySelector('input[type = file]')

  $('#img-file').change(function(){
    var file = $('input[type = file]').prop('files')[0];
    $.each(this.files, function(i, file){
      var file_img = new FileReader();

      dataBox.items.add(file)

      file_box.files = dataBox.files

      var num = $('.item-img').length + 1 + i
      file_img.readAsDataURL(file);

      // 投稿した画像が10枚になったらフォームを消す
      if(num == 10){
        $('#box').css('display', 'none')
      }
      // 画像をテキストボックスに入れた際に追加するビュー
      file_img.onload = function(){
        var src = file_img.result
        var html = `<div class = 'item-img' data-image = '$(file.name)}'>
                      <div class = 'item-img_content'>
                        <div class = 'item-img_content_icon'>
                          <img src="${src}" width="114" height="80">
                        </div>
                      </div>
                      <div class = 'item-img_operetion'>
                        <div class = 'item-img_operetion_delete'>削除</div>
                        <div class = 'item-img_operetion_edit'>編集</div>
                      </div>
                    </div>`
                        
        $('#box').before(html);
      };
      $('#box').attr('class', `sell-image_box-${num}`)
   });
  });
  
  // 画像を削除するアクション
  $(document).on('click', '.item-img_operetion_delete', function(){
    var delete_img = $(this).parent().parent()
    var delete_name = $('delete_img').data('image')
    if(file_box.files.length == 1){
      $('input[type=file]').val(null)
      dataBox.clearData();
    }else{
      $.each(file_box.files, function(i, input){
        if(input.name == delete_name){
          dataBox.items.remove(i)
        }
      })
      file_box.files = dataBox.files
    }
    delete_img.remove();
    
    var num = $('.item-img').length
    $('#box').show()
    $('#box').attr('class', `sell-image_box-${num}`)
  })
});