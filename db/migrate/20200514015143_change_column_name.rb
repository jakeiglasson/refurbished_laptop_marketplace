class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :laptops, :grade, :grade_id
  end
end
