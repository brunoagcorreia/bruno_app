class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.text :description
      t.string :image_url
      t.decimal :price

      t.timestamps
    end
  end
end
