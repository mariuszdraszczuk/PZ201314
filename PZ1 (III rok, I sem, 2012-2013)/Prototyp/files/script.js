$(function() {

	$('li#nav').mouseover(function() {
		$(this).css('background', '#00376f');
		$(this).children().eq(0).css('color','white');
	}).mouseout(function() {
		$('li#nav').css('background', 'white');
		$(this).children().eq(0).css('color','#00376f');
	});
	
	$('#wyszuk').click(function() {
		$(this).attr('value','');
	});
	
	$('#teraz').mouseover(function() {
		$(this).css('background', 'white');
	}).mouseout(function() {
		$('#teraz').css('background', '#ffa275');
	});
	
	$('#licytuj').mouseover(function() {
		$(this).css('background', 'white');
	}).mouseout(function() {
		$('#licytuj').css('background', '#ffa275');
	});
	
});