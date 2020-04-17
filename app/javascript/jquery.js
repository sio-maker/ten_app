$(function() {
    // フェードインアニメーション
  $('.top').hide().fadeIn(2000);
  $('.top h1').hide().fadeIn(4000);
  $('.contaner').hide();
  $('#how-fade').hide();
  $(window).scroll(function(){
    var obj_t_pos=$('.section2').offset().top;
    var how_t_pos=$('.how').offset().top;
    var scr_count=$(document).scrollTop()+ (window.innerHeight/2);
    if (scr_count>obj_t_pos){
      $('.contaner').fadeIn(2000);
    }
    if (scr_count>how_t_pos){
      $('#how-fade').fadeIn(1000);
    }
  })
  // フェードインアニメーションend
  // 画面切り替え
  $('.tab').click(function(){
		$('.is-active').removeClass('is-active');
		$(this).addClass('is-active');
		$('.is-show').removeClass('is-show');
        // クリックしたタブからインデックス番号を取得
		const index = $(this).index();
        // クリックしたタブと同じインデックス番号をもつコンテンツを表示
		$('.user-show-content').eq(index).addClass('is-show');
	});


});