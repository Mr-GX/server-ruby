class Lecturer < ApplicationRecord
	mount_uploader :avatar,AvatarUploader
	acts_as_followable
end
