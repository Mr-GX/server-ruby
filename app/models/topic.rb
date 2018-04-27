class Topic < ApplicationRecord
    has_many :blogs, dependent: :destroy
end
