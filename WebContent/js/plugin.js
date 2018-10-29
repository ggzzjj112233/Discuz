$(document).ready(function() {
	$("#li2").mouseover(function() {
		$('#doc').css('display', 'block');
	})

	$("#li2").mouseout(function() {
		$('#doc').css('display', 'none');
	})

	$("#li6").mouseover(function() {
		$('#doc1').css('display', 'block');
	})

	$("#li6").mouseout(function() {
		$('#doc1').css('display', 'none');
	})

	$("#li7").mouseover(function() {
		$('#doc2').css('display', 'block');
	})

	$("#li7").mouseout(function() {
		$('#doc2').css('display', 'none');
	})

	$("#kjmenuList").mouseover(function() {
		$('#kjmenu').css('display', 'block');
	})

	$("#kjmenuList").mouseout(function() {
		$('#kjmenu').css('display', 'none');
	})

	$('#collapsed').click(function() {
		if($(this).attr("src").indexOf("yes.gif") >= 0) {
			$(this).attr("src", "img/collapsed_no.gif");
			$('#client').css('display', 'block');
			$('#divBG').css('height', 195 + 'px');
		} else {
			$(this).attr("src", "img/collapsed_yes.gif");
			$('#client').css('display', 'none');
			$('#divBG').css('height', 60 + 'px');
		}
	})

	$('#tztable tr:eq(0) td:eq(1)').mouseover(function() {
		$('#tztable tr:eq(0) td:eq(2) a').css('display', 'block');
	})

	$('#tztable tr:eq(0) td:eq(1)').mouseout(function() {
		$('#tztable tr:eq(0) td:eq(2) a').css('display', 'none');
	})

	$('#tztable tr:eq(0) td:eq(2)').mouseover(function() {
		$('#tztable tr:eq(0) td:eq(2) a').css('display', 'block');
	})

	$('#tztable tr:eq(0) td:eq(2)').mouseout(function() {
		$('#tztable tr:eq(0) td:eq(2) a').css('display', 'none');
	})

	$('#tztable tr:eq(1) td:eq(1)').mouseover(function() {
		$('#tztable tr:eq(1) td:eq(2) a').css('display', 'block');
	})

	$('#tztable tr:eq(1) td:eq(1)').mouseout(function() {
		$('#tztable tr:eq(1) td:eq(2) a').css('display', 'none');
	})

	$('#tztable tr:eq(1) td:eq(2)').mouseover(function() {
		$('#tztable tr:eq(1) td:eq(2) a').css('display', 'block');
	})

	$('#tztable tr:eq(1) td:eq(2)').mouseout(function() {
		$('#tztable tr:eq(1) td:eq(2) a').css('display', 'none');
	})

	$('#tztable tr:eq(2) td:eq(1)').mouseover(function() {
		$('#tztable tr:eq(2) td:eq(2) a').css('display', 'block');
	})

	$('#tztable tr:eq(2) td:eq(1)').mouseout(function() {
		$('#tztable tr:eq(2) td:eq(2) a').css('display', 'none');
	})

	$('#tztable tr:eq(2) td:eq(2)').mouseover(function() {
		$('#tztable tr:eq(2) td:eq(2) a').css('display', 'block');
	})

	$('#tztable tr:eq(2) td:eq(2)').mouseout(function() {
		$('#tztable tr:eq(2) td:eq(2) a').css('display', 'none');
	})
})

$(window).scroll(function() {
	var scrolltop = $(document.documentElement).scrollTop();
	if(scrolltop >= 120) {
		$('#nav1').css('position', 'fixed');
		$('#nav1').css('top', 0);
	} else {
		$('#nav1').css('position', 'static');
	}
})