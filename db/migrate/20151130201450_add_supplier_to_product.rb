class AddSupplierToProduct < ActiveRecord::Migration
  def change
    add_column :products, :supplier, :string, default: 'apple'
  end
end
