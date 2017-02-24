class Lecturer < ApplicationRecord
	mount_uploader :avatar,AvatarUploader
end
