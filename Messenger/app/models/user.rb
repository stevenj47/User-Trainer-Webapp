class User < ApplicationRecord
	before_save { self.email = email.downcase }
	has_many :sent_messages, :class_name => 'Message', 
			 :foreign_key => 'sender_id'
	has_many :received_messages, :class_name => 'Message', 
			 :foreign_key => 'recipient_id'
	validates :name, presence: true,
					 length: { maximum: 40 }
	validates :email, presence: true,
					  uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, presence: true, 
						 length: { minimum: 6 }

	def is_user?
		client == 1
	end

	def name_title
		@title = is_user? ? ", USER" : ", TRAINER"
		"#{name}" + @title
	end
end
