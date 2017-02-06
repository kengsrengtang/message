class MessagesController < ApplicationController
  def create
    digested_message = MessageService.create params[:message]
    render json: {digest: digested_message.digest}, status: 200
  end

  def show
    digested_message = MessageService.get params[:id]
    if digested_message
      render json: {message: digested_message.message}, status: 200
    else
      render json: {err_msg: "Message not found"}, status: 404
    end
  end
end
