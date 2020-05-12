class AddSellerToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :seller, :integer, default: 0
  end
end
