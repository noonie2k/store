jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()

jQuery ->
  controller = window.location.pathname.split('/', 2)
  controller = controller.join('/')

  for link in $('.navbar ul li a')
    do (link) ->
      if controller == link.pathname
        $(link).parent().addClass('active')

  for link in $('#sidebar ul.nav li a')
    do (link) ->
      if window.location.pathname == link.pathname
        $(link).parent().addClass('active')
