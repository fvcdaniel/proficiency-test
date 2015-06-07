require 'spec_helper'

require 'rails_helper'

describe "Courses pages" do

  subject { page }

  describe "index" do

    before do
      visit courses_path
    end

    it { should have_title('Manter Cursos | Proficiency Test') }
    it { should have_link('Manter Alunos') }
    it { should have_link('Manter Cursos') }
    it { should have_link('Matrículas') }

  end
  

  describe "Cadastrar" do

    before { visit new_course_path }

    let(:submit) { "Criar Curso" }

    describe "with invalid information" do
      it "should not create a course" do
        expect { click_button submit }.not_to change(Course, :count)
      end

      describe "error messages" do
        before { click_button submit }

        it { should have_content('erro') }
      end
    end

    describe "with valid information" do
      before do
        fill_in "Nome",         with: "Example Course"
        fill_in "Descrição",    with: "Example Desc"
        select "ATIVO", :from => 'Status'
      end

      it "should create a course" do
        expect { click_button submit }.to change(Course, :count).by(1)
      end

      describe "after saving the course" do
        before { click_button submit }

        let(:course) { Course.find_by_name('Example Course') }

        it { should have_content("sucesso") }
        it { should have_selector('div.alert.alert-success', text: 'Curso Cadastrado com sucesso!') }
      end
    end
  end

 
end