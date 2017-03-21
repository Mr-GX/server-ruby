class Course < ApplicationRecord
	acts_as_followable
	acts_as_follower
	belongs_to :theme
end
