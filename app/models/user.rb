class User < ActiveRecord::Base

	validates :first_name, :last_name, :email_address, presence:true
	validates :email_address, email_format: {message: "Invalid email address"}
end
