class CreateHits < ActiveRecord::Migration
  def change
    create_table :hits do |t|
      t.string :match_gene_name
      t.text :match_gene_dna
      t.float :percent_similarity
      t.integer :subject_id
      t.string :subject_type

      t.timestamps null: false
    end
  end
end
