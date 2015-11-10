class CreateVoters < ActiveRecord::Migration
  def change
    create_table :voters do |t|
      t.string :name
      t.string :party

      t.timestamps null: false
    end
  end
end
