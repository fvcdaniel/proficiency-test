require 'rails_helper'

feature 'Criando Cursos' do
  scenario "posso criar um curso" do
    visit '/'

    click_link 'Manter Cursos'
    click_link 'Novo'

    fill_in 'Nome', with: 'Curso 1'
    fill_in 'Descrição', with: 'Este é um curso de teste'
    select "ATIVO", :from => "course[status]"
    click_button 'Criar Curso'

    expect(page).to have_content('Curso Cadastrado com sucesso!')
  end
end