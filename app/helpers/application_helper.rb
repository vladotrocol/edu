module ApplicationHelper
	def calculate_age(birthday)
		if  birthday
  			(Date.today - birthday).to_i / 365
  		else
  			0
  		end
	end
	def admin?
  		@current_user.admin == 1
  		# I made up the line above. Implement your own checks according to your setup
	end
end
