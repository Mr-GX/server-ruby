class Course < ApplicationRecord
	has_many :lecturers,dependent: :destroy
end
