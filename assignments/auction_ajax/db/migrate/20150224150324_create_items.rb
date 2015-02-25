class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.decimal :starting_price
      t.string :image_url

      t.timestamps null: false
    end
  end
end
