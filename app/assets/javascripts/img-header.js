$(function(){
  const img = ["img.ipg"];
  let num = -1;

  function slideshow_timer(){
    if(num == 1){
      num = 0;
    }else{
      num ++;
    }
    document.getElementById('img').src = img[num];
  }
   setInterval(slideshow_timer, 1000);
});