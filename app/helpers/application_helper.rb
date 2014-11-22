module ApplicationHelper
	def calculate_age(birthday)
  		(Date.today - birthday).to_i / 365
	end
end
