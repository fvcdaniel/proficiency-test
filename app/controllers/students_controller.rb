class StudentsController < ApplicationController
  
  before_action :correct_student, only: [:edit, :update]
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
    @courses = @student.courses
  end
  
  def new
    @student = Student.new
  end
  
  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "Aluno Cadastrado com sucesso!"
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    
  end

  def update
    if @student.update_attributes(student_params)
      flash[:success] = "Aluno atualizado com sucesso!"
      redirect_to @student
    else
      render 'edit'
    end
  end

  def destroy
    Student.find(params[:id]).destroy
    flash[:success] = "Student destroyed."
    redirect_to students_url
  end
  
  private
  
  def student_params
    params.require(:student).permit(:name, :register_number, :status)
  end
  
  def correct_student
    @student = Student.find(params[:id])
  end

end
