class CreateSequences < ActiveRecord::Migration
  def change
    create_table :sequences do |t|
      t.text :dna
      t.text :quality
      t.integer :assembly_id

      t.timestamps null: false
    end
  end
end
