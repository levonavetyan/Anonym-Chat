import consumer from "./consumer"

$(document).on('turbolinks:load', function () {
  var url = window.location.pathname;
  var id = url.substring(url.lastIndexOf('/') + 1);
  console.log(id)

  consumer.subscriptions.create({
    channel: "RoomChannel",
    room_id: id
    }, {
    connected() {
      // Called when the subscription is ready for use on the server
      console.log("Connected to the room!");
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      console.log("Recieving:")
      console.log(data)
      $('#post_msg').append(`<div class="card-block"><div class="row">
                       <div class="col-md-11"><p class="card-text"><span class="text-muted">`
                       + data.user.email  + ' at ' + data.timestamp + ' says</span><br>'
                       + data.message.content + '</p></div></div></div>')
      $('#msg').val('')

      }
  });

  let submit_messages;
  $(document).on('turbolinks:load', function () {
    submit_messages()
  })
  submit_messages = function () {
    $('#message_content').on('keydown', function (event) {
      if (event.keyCode == 13) {
        $('input').click()
        event.target.value = ''
        event.preventDefault()
      }
    })
  }
})