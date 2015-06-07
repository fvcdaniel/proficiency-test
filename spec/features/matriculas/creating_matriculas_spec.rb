require 'rails_helper'

feature 'Matriculando Alunos' do
  before do
    @course = Course.new(name: "Curso 1", description: "Curso de teste", status: 1)
    @course.save
    @student = Student.new(name: "Aluno 1", register_number: 2333444, status: 1)
    @student.save
  end
  scenario "posso matricular um aluno e desfazer matricula" do
    visit '/'
    
    expect(page).not_to have_link('Cancelar matrícula...')
    
    click_link 'Matrículas'
    click_link 'Selecionar'
    click_link 'Matricular aluno...'

    expect(page).to have_content('Matricula efetuada com sucesso!')
    expect(page).not_to have_link('Matricular aluno...')
    expect(page).to have_link('Cancelar matrícula...')
    
    click_link 'Cancelar matrícula...'
    expect(page).to have_content('Matricula cancelada com sucesso!')
  end
end