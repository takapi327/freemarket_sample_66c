$(function(){
  $("#tabs li").hover(() => {
    $(".pull-dawn").addClass("show");
  },function() {
    $("ul#tab").removeClass("show");
  });
  
  $(".pull_list1").hover(() => {
    $(".pull_menu2").addClass("show");
  },function(){
    $(".pull_menu2").removeClass("show");
  });

  $(".pull_sblist1").hover(() => {
    $(".pull_sbmenu").addClass("show");
  },function(){
    $(".pull_sbmenu").removeClass("show");
  });

  $(".pull_list2").hover(() => {
    $(".pull_menu3").addClass("show");
  },function(){
    $(".pull_menu3").removeClass("show");
  });

  $("#tab2s li").hover(() => {
    $(".pull-dawn2").addClass("show");
  },function() {
    $("ul#tab").removeClass("show");
  });
});
