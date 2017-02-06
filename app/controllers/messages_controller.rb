class MessagesController < ApplicationController
  def create
    digested_message = MessageService.create params[:message]
    render json: {digest: digested_message.digest}, status: 200
  end

  def show
  end
end
