class CreateProductDetails < ActiveRecord::Migration
  def change
    create_table :product_details do |t|
      t.references :product, index: true, foreign_key: true
      t.string :image_url
      t.text :long_description
      t.string :manufacturer
      t.string :country_of_origin
      t.decimal :volume_in_liter, precision: 6, scale: 2
      t.decimal :alcohol_by_volume, precision: 6, scale: 2
      t.decimal :calories_in_kcal_per_100ml, precision: 6, scale: 2
      t.string :grape_type

      t.timestamps null: false
    end
  end
end
