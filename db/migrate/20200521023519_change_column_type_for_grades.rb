class ChangeColumnTypeForGrades < ActiveRecord::Migration[6.0]
  def change
    remove_column :grades, :name, :text
    remove_column :grades, :description, :text
    add_column :grades, :name, :string
  end
end
