class PagesController < ApplicationController
  def index
  	if logged_in?
  		@num_unread = current_user.received_messages.select { |recv| recv.read == false }.length
  	end
  end
end
