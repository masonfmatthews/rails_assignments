class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.integer :developer_id
      t.integer :project_id
      t.date :worked_on
      t.decimal :duration

      t.timestamps null: false
    end
  end
end
