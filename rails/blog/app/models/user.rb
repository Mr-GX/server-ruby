class User < ApplicationRecord
	validates :mobile,uniqueness:{message:"mobile can not repeat!"}
	ADMIN_STATUS = {
      '是' => 1,
      '否' => 0,
    }
end
