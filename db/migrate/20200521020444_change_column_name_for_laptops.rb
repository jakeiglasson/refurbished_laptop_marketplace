class ChangeColumnNameForLaptops < ActiveRecord::Migration[6.0]
  def change
    rename_column :laptops, :brand_id, :laptop_brand_id
  end
end
