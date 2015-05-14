$(document).ready(function() {
				$.ajax({
					url: '/comps',
					dataType: 'json',
					type: 'GET'
				}).done(function(resp) {
						resp.forEach(function(comp){
							$('#list').append("<li>" + comp.text + "</li>");
						});
				});
				$('#submit').on('click', function(e) {
					e.preventDefault();
					$.ajax({
						method: 'POST',
						url: '/comps',
						dataType: 'json',
						data: JSON.stringify({ text: $('#blah').val() })
					});
				});
});