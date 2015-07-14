class CreateGroupAssignments < ActiveRecord::Migration
  def change
    create_table :group_assignments do |t|
      t.integer :developer_id
      t.integer :group_id

      t.timestamps null: false
    end
  end
end
