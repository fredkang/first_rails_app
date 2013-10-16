class User < ActiveRecord::Base

	validates :first_name, :last_name, :email_address, presence:true
	validates :email_address, email_format: {message: "Invalid email address"}
	validates :email_address, uniqueness: {case_sensitive:false, message: "This email already exists"}
end
