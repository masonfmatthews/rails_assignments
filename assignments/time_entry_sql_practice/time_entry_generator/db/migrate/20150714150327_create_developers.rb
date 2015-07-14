class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.string :name
      t.string :email
      t.date :joined_on

      t.timestamps null: false
    end
  end
end
