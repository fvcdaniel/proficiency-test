class HomeController < ApplicationController
  
  before_action :correct_matricula, only: [:matricula_curso, :matricular, :cancelar_matricula]
  
  def index
  end
  
  def matriculas
    @courses = Course.all
  end
  
  def matricula_curso

  end
  
  
  def matricular
    
    @student = Student.find(params[:student_id])
    
    unless @course.students.include? @student
      c = Classroom.new(student: @student, course: @course, entry_at: Time.now)
      c.save
      correct_matricula
      flash.now[:success] = "Matricula efetuada com sucesso!"
    else
      flash.now[:alert] = "Aluno ja matriculado"
    end
    
    render :matricula_curso
  end
  
  def cancelar_matricula
    @matricula = Classroom.where(course: Course.find(params[:id]), student: Student.find(params[:student_id])).first
    @matricula.destroy
    flash[:success] = "Matricula cancelada com sucesso!"
    redirect_to :matricula_curso
  end
  
  private 
  
  def correct_matricula
    @course = Course.find(params[:id])
    @students = Student.where(status: 1) - @course.students
    @matriculas = Classroom.where(course: @course)
  end
  
end
