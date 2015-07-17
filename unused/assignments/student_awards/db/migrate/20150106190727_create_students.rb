class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.integer :teacher_id

      t.timestamps null: false
    end
  end
end
