class CreateGenes < ActiveRecord::Migration
  def change
    create_table :genes do |t|
      t.text :dna
      t.integer :starting_position
      t.boolean :direction
      t.integer :sequence_id

      t.timestamps null: false
    end
  end
end
