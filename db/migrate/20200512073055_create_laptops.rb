class CreateLaptops < ActiveRecord::Migration[6.0]
  def change
    create_table :laptops do |t|
      t.bigint :user_id
      t.bigint :brand_id
      t.string :grade
      t.bigint :cpu_id
      t.bigint :ram_id
      t.bigint :hard_drive_id
      t.string :model
      t.integer :price
      t.integer :sold_status

      t.timestamps
    end
  end
end
