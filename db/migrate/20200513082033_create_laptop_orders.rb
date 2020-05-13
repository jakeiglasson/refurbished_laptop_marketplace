class CreateLaptopOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :laptop_orders do |t|
      t.bigint :user_id
      t.bigint :laptop_id

      t.timestamps
    end
  end
end
