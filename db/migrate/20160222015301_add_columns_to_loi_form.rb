class AddColumnsToLoiForm < ActiveRecord::Migration
  def change
    add_column :loi_forms, :employees, :integer
    add_column :loi_forms, :volunteers, :integer
    add_column :loi_forms, :board, :integer
    add_column :loi_forms, :budget, :decimal, precision: 12, scale: 2
    add_column :loi_forms, :affiliated, :text
  end
end
