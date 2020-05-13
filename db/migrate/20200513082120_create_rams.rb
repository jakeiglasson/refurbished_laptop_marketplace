class CreateRams < ActiveRecord::Migration[6.0]
  def change
    create_table :rams do |t|
      t.string :name

      t.timestamps
    end
  end
end
