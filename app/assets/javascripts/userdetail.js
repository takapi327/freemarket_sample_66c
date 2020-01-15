jQuery(function($){
	$('.tab3').click(function(){
		$('.is-active').removeClass('is-active');
		$(this).addClass('is-active');
		$('.is-show').removeClass('is-show');
        // クリックしたタブからインデックス番号を取得
		const index = $(this).index();
        // クリックしたタブと同じインデックス番号をもつコンテンツを表示
		$('.panel').eq(index).addClass('is-show');
	});
});

jQuery(function($){
	$('.tab1').click(function(){
		$('.is-active1').removeClass('is-active1');
		$(this).addClass('is-active1');
		$('.is-show1').removeClass('is-show1');
        // クリックしたタブからインデックス番号を取得
		const index = $(this).index();
        // クリックしたタブと同じインデックス番号をもつコンテンツを表示
		$('.panel1').eq(index).addClass('is-show1');
	});
});

