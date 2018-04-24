class Api::V1::MessagesController < ApplicationController
  expose :messages, -> { current_user.chat_messages }

  def index
    render_api(messages, :ok, each_serializer: ChatMessagesSerializer)
  end
end
