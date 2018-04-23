class Api::V1::MessagesController < ApplicationController
  def index
    render json: ChatMessage.all
  end
end
