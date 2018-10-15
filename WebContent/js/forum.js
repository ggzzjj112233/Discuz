$(document).ready(function() {
	var dw = ($(document.documentElement).innerWidth() - $('#divbody').outerWidth()) / 2;
	var mw = $('#divmark').outerWidth();
	if(dw < mw) {
		$('#divmark').css('right', 0);
	} else {
		$('#divmark').css('right', (dw - mw) + 'px');
	}

	$('dl>dt>img').click(function() {
		if($(this).attr("src").indexOf("yes.gif") >= 0) {
			$(this).attr("src", "img/collapsed_no.gif");
			$(this).parent().next().slideDown(300);
		} else {
			$(this).attr("src", "img/collapsed_yes.gif");
			$(this).parent().next().slideUp(300);
		}
	})

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

})

$(window).resize(function() {
	var dw = ($(document.documentElement).innerWidth() - $('#divbody').outerWidth()) / 2 ;
	var mw = $('#divmark').outerWidth();
	if(dw < mw) {
		$('#divmark').css('right', 0);
	} else {
		$('#divmark').css('right', (dw - mw) + 'px');
	}
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