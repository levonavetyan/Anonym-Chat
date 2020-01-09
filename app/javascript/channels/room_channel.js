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

      if(data.user.id != parseInt(document.cookie.split('=')[1], 10)){
        $('#post_msg').append(`<div class="chat_text_area"><p class="message-content ">` +
        data.message.content + `</p><div class="msg-d"> <p class="message-data">` + data.timestamp +
        `</p></div></div>`)
      }
      else{
        console.log("here")
        $('#post_msg').append(`<div class="chat_text_area"><p class="user_message-content ">` +
        data.message.content + `</p><div class="msg-d"> <p class="user_message-data">` + data.timestamp +
        `</p></div></div>`)
      }

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
