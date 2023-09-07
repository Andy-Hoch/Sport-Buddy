class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom)
    @created_chatrooms = current_user.my_events.map(&:chatroom)
    @joined_chatrooms = current_user.attendees.map(&:sport_session).map(&:chatroom)
    @chatrooms = @created_chatrooms + @joined_chatrooms
    # authorize @chatrooms
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end
end
