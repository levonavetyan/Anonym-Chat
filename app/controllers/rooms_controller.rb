class RoomsController < ApplicationController
    # Loads:
    # @rooms = all rooms
    # @room = current room when applicable
    # before_action :load_entities
    # def show
    #   @room_message = RoomMessage.new room: @room
    #   @room_messages = @room.room_messages.includes(:user)
    # end
     
    # def index
    #   @rooms = Room.all
    # end
  
    # def new
    #   @room = Room.new
    # end
  
    # def create
    #   @room = Room.new permitted_parameters
  
    #   if @room.save
    #     flash[:success] = "Room #{@room.name} was created successfully"
    #     redirect_to rooms_path
    #   else
    #     render :new
    #   end
    # end
  
    # def edit
    # end
  
    # def update
    #   if @room.update_attributes(permitted_parameters)
    #     flash[:success] = "Room #{@room.name} was updated successfully"
    #     redirect_to rooms_path
    #   else
    #     render :new
    #   end
    # end
  
    # protected
  
    # def load_entities
    #   @rooms = Room.all
    #   @room = Room.find(params[:id]) if params[:id]
    # end
  
    # def permitted_parameters
    #   params.require(:room).permit(:name)
    # end
    def index
      @rooms = Room.all
    end
  
    def new
      @room = Room.new
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
      params.require(:room).permit(:title)
    end
  end