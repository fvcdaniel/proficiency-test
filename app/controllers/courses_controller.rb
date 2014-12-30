class CoursesController < ApplicationController
    
  before_action :correct_course, only: [:edit, :update]
  
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @students = @course.students
  end
  
  def new
    @course = Course.new
  end
  
  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:success] = "Curso Cadastrado com sucesso!"
      redirect_to @course
    else
      render 'new'
    end
  end

  def edit
    
  end

  def update
    if @course.update_attributes(course_params)
      flash[:success] = "Curso atualizado com sucesso!"
      redirect_to @course
    else
      render 'edit'
    end
  end

  def destroy
    Course.find(params[:id]).destroy
    flash[:success] = "Course destroyed."
    redirect_to courses_url
  end
  
  private
  
  def course_params
    params.require(:course).permit(:name, :description, :status)
  end
  
  def correct_course
    @course = Course.find(params[:id])
  end
  
end
