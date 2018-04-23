class Api::V1::MessagesController < ApplicationController
  before_action :authenticate_with_token!
  def index
    render json: ChatMessage.all
  end
end
