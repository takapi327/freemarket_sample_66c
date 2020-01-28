$(function() {
  $('img.sub-image').mouseover(function(){
  // "_thumb"を削った画像ファイル名を取得
  var selectedSrc = $(this).attr('src').replace(/^(.+)_thumb(\.gif|\.jpg|\.png+)$/, "$1"+"$2");
  
  // 画像入れ替え
  $('img.main-image').stop().fadeOut(100,
  function(){
  $('img.main-image').attr('src', selectedSrc);
  $('img.main-image').stop().fadeIn(200);
  }
  );
  // サムネイルの枠を変更
  $(this).css({"opacity": "1"});
  });
  
  // // マウスアウトでサムネイル枠もとに戻す
  $('img.sub-image').mouseout(function(){
  $(this).css({"opacity": "0.4"});
  });
 });