$ ->
	if $('#g_bootstrap').length > 0
		$('#awesome-button').click ->
      if confirm 'Are you sure you can handle the awesomeness?'
        container = $('#g_bootstrap')
        container.css('position', 'relative')
        for i in [1..1000]
          f = ->
            x = Math.round Math.random() * 100
            y = Math.round Math.random() * 100
            r = Math.round Math.random() * 255
            g = Math.round Math.random() * 255
            b = Math.round Math.random() * 255
            a = 0.5 + Math.random() / 2
            $("<div style=\"position: absolute; left: #{x}%; top: #{y}%;font-weight: bold; color: rgba(#{r},#{g},#{b},#{a})\">AWESOME!</div>").appendTo container
          setTimeout f, i * 25