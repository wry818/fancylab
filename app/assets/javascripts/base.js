window.Fancylab = {
	AlertWindow: function (message) {
		
		var browser_width = $(window).width();
		var width = '20%';
		var left = '40%';
		
		if (browser_width <= 640) {
			width = '50%';
			left = '25%';
		}
		
		$.blockUI({ 
			message: message,
			css: { 
				border: 'none', 
				width: width, 
				left: left,
				opacity: 0.7,
				backgroundColor:'transparent'
			},
			overlayCSS: { 
				opacity: 0  
			}
		
		}); 
		
		setTimeout($.unblockUI, 2000);
		
	},
	Alert: function(message) {
		
		$.blockUI({ 
			message: message,
			css: {
				border: 'none', 
				padding: '15px', 
				backgroundColor: '#000',
				'-webkit-border-radius': '10px', 
				'-moz-border-radius': '10px', 
				opacity: 0.9, 
				color: '#fff' 
			},
			overlayCSS: { 
				opacity: 0  
			}
  
		}); 
		setTimeout($.unblockUI, 2000); 
		
	}
}

//These are javascript methods that are used by both the main app and the admin app
$(document).ready(function() {
});
