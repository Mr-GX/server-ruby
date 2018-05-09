class Topic < ApplicationRecord
    require 'carrierwave/orm/activerecord'

    mount_uploader :image, ImageUploader
    has_many :blogs, dependent: :destroy

    def crop
      	image.recreate_versions!
  	end
end
