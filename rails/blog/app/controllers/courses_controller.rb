class CoursesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_course,only:[:show,:edit,:update,:destroy]
	def new
		@course=Course.new
	end

	def index
	    @courses=Course.all
	end

	def create
		@course=Course.new(course_params)
		if @course.save
			params[:lecturers].each do |lecturer_id|
				lecturer=Lecturer.find(lecturer_id)
				@course.lecturers << lecturer unless @course.lecturers.include?(lecturer)
			end
			redirect_to courses_path
		else
			render 'new'
		end
	end

	def show
		
	end

	def edit

	end

	def update
		params[:lecturers].each do |lecturer_id|
			lecturer=Lecturer.find(lecturer_id)
			@course.lecturers << lecturer unless @course.lecturers.include?(lecturer)
		end
		if @course.update(course_params)
			redirect_to courses_path
		else
			render 'edit'
		end
	end
	def destroy
		@course.destroy
		redirect_to courses_path
	end
	private
	def course_params
		params.require(:course).permit(:tag,:title,:sub_title,:desc,:select_lecturer)
	end

	def set_course
		@course=Course.find(params[:id])
	end
end
