class Room extends Spine.Model
  @configure 'Room', 'name', 'user_id', 'description'
  @extend Spine.Model.Ajax

Room.include
  messages: ->
      room_id = @id
      Message.select (m) ->
        m.room_id is room_id

window.Room = Room
