jQuery(document).ready(function ($) {
	setTimeout( function(){
		var bw_offset = 250;
		var thumb_idx = 0;
		$('.uk-thumbnail > .uk-overlay').each(function(){//present thumbs in color by default then fade to b&w
			var $el = $(this);
			thumb_idx++;
			setTimeout( function(){ $el.addClass('fd-bw'); }, thumb_idx * bw_offset);
		});
	}, 250);

	$('a[href=#contactMe]').on('click', function(){
		setTimeout( function(){
			var $el = $('#email');
			$el.attr( 'title', 'What\'s on your mind?' );
			UIkit.tooltip($el, {animation:true, pos:'top-left', offset:84 });
			$el.focus(); //tooltip displays
			setTimeout(function(){
				$el.blur();//hide tooltip
				$el.attr('title', '');//remove tooltip
				$el.focus();//focus input
			}, 2500);
		}, 1000);
	});

	$('.uk-form').submit(function(event){//if we get this far, HTML5 validation has already executed
		event.preventDefault();

		var $theForm = $(this);
		var $theBtn = $('button', this);
		$theBtn.attr('disabled', 'disabled');
		$theBtn.siblings('.uk-icon-spinner').removeClass('uk-hidden');
		$('.form-msg', $theForm).html('');

		var email1 = $('#email',$theForm).val().trim();
		var msg1 = $('#msg', $theForm).val().trim();

		$.post('/tellafriend.php', { email:email1, msg:msg1 }, function(resp){
			if ( resp == 'ok' ) {
				$('.form-msg', $theForm).html('Thanks for your message.  I\'ll get back to you soon.');
			} else {
				$('.form-msg', $theForm).html('Sorry, there was a problem sending your message.  Please&nbsp;try&nbsp;again.');
			}

			$theBtn.removeAttr('disabled');
			$theBtn.siblings('.uk-icon-spinner').addClass('uk-hidden');
		})
    });
});