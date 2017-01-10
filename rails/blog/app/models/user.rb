class User < ApplicationRecord
	validates :name,presence:{message:"姓名不能为空!"}
	validates :mobile,presence:{message:"手机号不能为空!"},uniqueness:{message:"手机号已存在!"},format:{with: /\A((\+?86)|(\(\+86\)))?1\d{10}\z/,message: "手机号不合法!"}
	validates :email,presence:{message:"邮箱不能为空!"},uniqueness:{message:"邮箱已存在!"},format:{with: /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/,message: "邮箱不合法!"}
	validates :activated,presence:{message:"时间不能为空!"}
	ADMIN_STATUS = {
      '是' => 1,
      '否' => 0,
    }
end
