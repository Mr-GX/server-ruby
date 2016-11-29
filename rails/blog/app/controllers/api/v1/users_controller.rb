class Api::V1::UsersController < ApplicationController
	def show
		if User.exists?(params[:id])
			render json: {
                 status: {
                     code: 1,
                     msg: '成功'
                 },
                 data: User.find(params[:id])
             }
         else
			render json: {
                 status: {
                     code: 0,
                     msg:  '失败'
                 },
                 data: nil
             }
         end
	end
end
