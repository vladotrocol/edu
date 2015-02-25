class CoursesController < ApplicationController
  def index
  	@courses = Course.all
  end

  def show
  end

  def edit
  end

  def new
  	@course = Course.new({:title => 'New Title'})
  end

  def create
  	@course = Course.new(course_params)
    @course.content = dat_markdown(@course.content)
	if @course.save
        flash[:notice] = "Course created successfully."
			redirect_to(:action => 'index')
		else
			render('new')
		end
  end

  def course_params
	params.require(:courses).permit(:title, :description, :content)
  end

end
