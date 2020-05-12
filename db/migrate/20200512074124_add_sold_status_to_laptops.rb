class AddSoldStatusToLaptops < ActiveRecord::Migration[6.0]
  def change
    add_column :laptops, :sold_status, :integer, default: 0
  end
end
