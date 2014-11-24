class Course < ActiveRecord::Base
	hhas_and_belongs_to_many :users
end
