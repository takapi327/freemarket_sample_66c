$(function(){
  $('.sub-image li').hover(function(){
      //オーバーしたliのインデックスを取得
      var index = $('.sub-image li').index(this);
      //オーバーした画像URLを取得
      var imageurl = $('.sub-image li').eq(index).find('img').attr('src');
      //ulのクラス名を取得（空白で分割）
      className = $(this).parent().attr('class').split(" ");
      //元のメイン画像を保存しておく
      defaultImage = $('.main-image'+className[1]).attr('src');
      $('.main-image'+className[1]).attr('src',imageurl);
  },function(){
      $('.main-image'+className[1]).attr('src',defaultImage);
  });
});