class CoursesController < ApplicationController
	before_action :authenticate_user!
	def new
		@course=Course.new
	end

	def index
	    @courses=Course.all
	end
	def create
		@course=Course.new(course_params)
		if @course.save
			redirect_to new_course_lecturer_path(@course)
		else
			render 'new'
		end
	end

	def show
		@course=Course.find(params[:id])
	end
	def destroy
		@course=Course.find(params[:id])
		@course.destroy

		redirect_to courses_path
	end
	private
	def course_params
		params.require(:course).permit(:tag,:title,:sub_title,:desc)
	end
end
