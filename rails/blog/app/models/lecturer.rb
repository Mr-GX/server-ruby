class Lecturer < ApplicationRecord
	mount_uploader :avatar,AvatarUploader
	belongs_to :course
end
