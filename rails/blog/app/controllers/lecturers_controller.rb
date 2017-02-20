class LecturersController < ApplicationController
	def new
		@course=Course.find(params[:course_id])
	end

	def create
		@lecturer=Course.find(params[:course_id]).lecturers.new(lecturer_params)
		if @lecturer.save
			redirect_to courses_path
		else
			render 'new'
		end
	end

	private
	def lecturer_params
		params.require(:lecturer).permit(:name,:desc)
	end
end
