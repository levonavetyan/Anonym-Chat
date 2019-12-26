def create
    @room_message = RoomMessage.create user: current_user,
                                       room: @room,
                                       message: params.dig(:room_message, :message)
 
    RoomChannel.broadcast_to @room, @room_message
  end