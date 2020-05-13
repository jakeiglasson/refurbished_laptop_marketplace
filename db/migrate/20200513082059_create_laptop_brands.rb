class CreateLaptopBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :laptop_brands do |t|
      t.string :name

      t.timestamps
    end
  end
end
