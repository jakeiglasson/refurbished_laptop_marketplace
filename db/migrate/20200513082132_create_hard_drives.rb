class CreateHardDrives < ActiveRecord::Migration[6.0]
  def change
    create_table :hard_drives do |t|
      t.string :name

      t.timestamps
    end
  end
end
