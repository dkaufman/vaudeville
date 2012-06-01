$ = jQuery.sub()

# $.fn.item = ->
#   elementID   = $(@).data('id')
#   elementID or= $(@).parents('[data-id]').data('id')

class App.Home extends Spine.Controller
  # events:
  #   'submit form': 'submit'

  constructor: ->
    super
    
  render: =>
    @html @view('home/index')()
    
  # submit: (e) ->
  #   e.preventDefault()
  #   alert "submit!"
    
class App.Home extends Spine.Stack
  controllers:
    home: App.AppHome
    
  routes:
    '/':          'home'

  className: 'stack home'
