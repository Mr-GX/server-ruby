class LecturersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_lecturer,only:[:show,:edit,:update,:destroy]
	def new
		@lecturer=Lecturer.new
		render layout: "desk_page"
	end

	def index
		@lecturers=Lecturer.all
		render layout: "desk_page"
	end

	def show
		render layout: "desk_page"
	end

	def edit
		render layout: "desk_page"
	end

	def create
		@lecturer=Lecturer.new(lecturer_params)
		if @lecturer.save
			redirect_to lecturers_path
		else
			render 'new'
		end
	end

	def update
		if @lecturer.update(lecturer_params)
			redirect_to lecturers_path
		else
			render 'edit'
		end
	end

	def destroy
		@lecturer.destroy

		redirect_to lecturers_path
	end

	private
	def lecturer_params
		params.require(:lecturer).permit(:avatar,:name,:desc)
	end

	def set_lecturer
		@lecturer=Lecturer.find(params[:id])
	end
end
