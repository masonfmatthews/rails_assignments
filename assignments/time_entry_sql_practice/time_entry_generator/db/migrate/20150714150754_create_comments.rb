class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :subject_id
      t.string :subject_type
      t.integer :developer_id
      t.text :comment

      t.timestamps null: false
    end
  end
end
