class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.string :name
      t.integer :student_id
      t.date :awarded_on

      t.timestamps null: false
    end
  end
end
