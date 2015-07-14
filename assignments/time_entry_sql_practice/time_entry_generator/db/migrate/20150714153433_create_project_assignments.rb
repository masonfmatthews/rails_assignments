class CreateProjectAssignments < ActiveRecord::Migration
  def change
    create_table :project_assignments do |t|
      t.integer :developer_id
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
