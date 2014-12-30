class AddIndexToStudentsRegisterNumber < ActiveRecord::Migration
  def change
    add_index :students, :register_number, unique: true
  end
end
