#= require pusher

$ = jQuery

class PusherHandler extends Spine.Module
  
  constructor: (@options = {}) ->
    @options.key or= $('meta[name=pusher-key]').attr('content')

    @pusher = new Pusher(@options.key, @options)

    $.ajaxSetup
      beforeSend: (xhr) =>
        xhr.setRequestHeader 'X-Session-ID', @pusher.connection.socket_id

    @room = @pusher.subscribe 'testing'
    @room.bind_all @processWithoutAjax

  process: (type, msg) =>
    klass = eval(msg.class)
    switch type
      when 'create'
        klass.create msg
      when 'test'
        console.log klass
      else
        throw 'Unknown type:' + type

  processWithoutAjax: =>
    args = arguments
    Spine.Ajax.disable =>
      @process(args...)

$ -> new PusherHandler