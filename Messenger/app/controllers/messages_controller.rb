class MessagesController < ApplicationController
	before_action :logged_in_user

	def index
		@sent = current_user.sent_messages
		@received = current_user.received_messages
	end

	def new
		@message = Message.new
		@recipients = User.where.not(id: current_user.id).order(:name)
	end

	def create
		@message = Message.new(message_params)
		if @message.save
			redirect_to messages_path
		else
			render 'new'
		end
	end

	private

		def message_params
			params.require(:message).permit(:body, :sender_id,
										 	:recipient_id)
		end

	  	def logged_in_user
      		unless logged_in?
        		redirect_to login_path
      		end
    	end
end
