class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, length: 45
      t.string :description, length: 45
      t.integer :status

      t.timestamps
    end
  end
end
