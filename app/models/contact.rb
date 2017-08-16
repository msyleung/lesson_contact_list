class Contact < ActiveRecord::Base
	#add validation
	validates :name, :email, :phone, presence: true
end
