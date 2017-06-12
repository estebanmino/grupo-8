App.room = App.cable.subscriptions.create "RoomChannel",
  connected:->
  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append data['message']
    console.log data['message']
    alert('udueduedue')

  speak: (message) ->
    @perform 'speak', message: message

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
if event.keyCode is 13
  App.room.speak event.target.value
  event.target.value = ''
  event.preventDefault()
