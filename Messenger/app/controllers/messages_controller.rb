class MessagesController < ApplicationController
	before_action :logged_in_user
	before_action :trainer_only, only: [:broadcast, :create_broadcast]

	def index
		@sent = current_user.sent_messages
		@received = current_user.received_messages
		@read, @unread = [], []
		@received.each do |recv|
			if recv.read == true
				@read << recv
			else
				@unread << recv
				recv.read = true
				recv.save
			end
		end
	end

	def new
		@message = Message.new
		@recipients = User.where.not(id: current_user.id).order(:name)
	end

	def create
		@message = Message.new(message_params)
		if @message.save
			flash[:notice] = "Message sent"
			redirect_to messages_path
		else
			flash[:error] = "Message not sent"
			redirect_to new_message_path
		end
	end

	def broadcast
		@message = Message.new
	end

	def create_broadcast
		@recipients = User.where.not(id: current_user.id).order(:name)
		@recipients.each do |r|
			@message = Message.new(broadcast_params)
			@message.recipient_id = r.id
			if @message.save
			else
				flash[:error] = "Broadcast failed"
			end
		end

		flash[:notice] = "Broadcast successful"
		redirect_to messages_path
	end

	private

		def message_params
			params.require(:message).permit(:body, :sender_id,
										 	:recipient_id)
		end

		def broadcast_params
			params.require(:message).permit(:body, :sender_id)
		end

	  	def logged_in_user
      		unless logged_in?
      			flash[:error] = "You must be logged in"
        		redirect_to login_path
      		end
    	end

    	def trainer_only
    		if current_user.is_user?
    			flash[:error] = "You must be a trainer"
    			redirect_to messages_path
    		end
    	end
    
end
