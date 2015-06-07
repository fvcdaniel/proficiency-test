require 'rails_helper'

feature 'Criando Alunos' do
  scenario "posso criar um aluno" do
    visit '/'

    click_link 'Manter Alunos'
    click_link 'Novo'

    fill_in 'Nome', with: 'Aluno 1'
    fill_in 'RG', with: '2999123'
    select "ATIVO", :from => "student[status]"
    click_button 'Criar Aluno'

    expect(page).to have_content('Aluno Cadastrado com sucesso!')
  end
end