class RoomsController < ApplicationController
  # def index
  #   @rooms = Room.all
  # end

  # def new
  #   @room = Room.new
  # end

  # def create
  #   @room = current_user.rooms.build(room_params)
  #   if @room.save
  #     flash[:success] = 'Room added!'
  #     redirect_to rooms_path
  #   else
  #     flash[:error] = @room.errors.full_messages.to_sentence
  #     render 'new'
  #   end
  # end

  # def show
  #   @room = Room.includes(:messages).find_by(id: params[:id])
  #   @message = Message.new
  # end

  # private

  # def room_params
  #   params.require(:room).permit(:title)
  # end
  def index
    @rooms = Room.all
  end

  def new
    # @room = Room.new
    @room = current_user.rooms.build
    puts("here")
    puts(current_user.email)
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      flash[:success] = 'Room added!'
      redirect_to rooms_path
    else
      flash[:error] = @room.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def show
    @room = Room.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

  private

  def room_params
    params.require(:room).permit(:title, :user_id)
  end
end