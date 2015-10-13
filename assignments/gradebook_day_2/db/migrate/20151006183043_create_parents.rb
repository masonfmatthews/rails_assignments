class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
