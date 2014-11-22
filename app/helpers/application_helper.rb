module ApplicationHelper
	def calculate_age(birthday)
		if  birthday
  			(Date.today - birthday).to_i / 365
  		else
  			0
  		end
	end
end
