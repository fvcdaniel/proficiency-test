require 'spec_helper'

require 'rails_helper'

describe "Student pages" do

  subject { page }

  describe "index" do

    before do
      FactoryGirl.create(:student)
      FactoryGirl.create(:student, name: "Bob", register_number: 1234567)
      FactoryGirl.create(:student, name: "Alice", register_number: 1234568)
      visit students_path
    end

    it { should have_title('Manter Alunos | Proficiency Test') }
    it { should have_link('Manter Alunos') }
    it { should have_link('Manter Cursos') }
    it { should have_link('Matrículas') }

  end
  

  describe "Cadastrar" do

    before { visit new_student_path }

    let(:submit) { "Criar Aluno" }

    describe "with invalid information" do
      it "should not create a student" do
        expect { click_button submit }.not_to change(Student, :count)
      end

      describe "error messages" do
        before { click_button submit }

        it { should have_content('erro') }
      end
    end

    describe "with valid information" do
      before do
        fill_in "Nome",         with: "Example Student"
        fill_in "RG",           with: "12345678"
        #fill_in "Status",       with: "ATIVO"
        select "ATIVO", :from => 'Status'
      end

      it "should create a student" do
        expect { click_button submit }.to change(Student, :count).by(1)
      end

      describe "after saving the student" do
        before { click_button submit }

        let(:student) { Student.find_by_register_number('12345678') }

        it { should have_content("sucesso") }
        it { should have_selector('div.alert.alert-success', text: 'Aluno Cadastrado com sucesso!') }
      end
    end
  end

 
end