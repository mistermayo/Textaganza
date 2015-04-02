class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
    @message.to = params[:to]
  end

  def show
    @message = Message.find(params[:id])
    @messages = Message.all
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Message Sent Sucessfully!!"
      redirect_to messages_path
    else
      render :new
    end
  end

  private
  def message_params
    params.require(:message).permit(:to, :from, :body, :user_id)
  end
end
