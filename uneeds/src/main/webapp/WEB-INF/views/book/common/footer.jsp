<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Footer -->
<footer class="py-1 bg-dark fixed-bottom footer">
	<div class="container">
		<div id="clock"></div>
		<p class="m-0 text-center text-white">Copyright &copy; UNEEDS 2018</p>
	</div>
	<!-- /.container -->
</footer>

<script>
// 스크롤 이동시
$(window).scroll(function() {
	$('.footer').removeClass("fixed-bottom");
	$('.footer').addClass("display-none");
	setTimeout(function(){
		$('.footer').addClass("fixed-bottom");
		$('.footer').removeClass("display-none");
		$('.footer').addClass("animated animatedFadeInUp fadeInUp");
	}, 1000);	 
});
</script>