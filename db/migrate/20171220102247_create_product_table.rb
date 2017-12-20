class CreateProductTable < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :product_type
      t.string :custom_id
      t.string :category
    end
  end
end
