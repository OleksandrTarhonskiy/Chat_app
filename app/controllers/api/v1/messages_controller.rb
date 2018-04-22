class MessagesController < ApplicationController
  def index
    render json: ChatMessage.all 
  end
end
