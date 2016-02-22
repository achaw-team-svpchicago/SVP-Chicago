class EditColumnToLoiForm < ActiveRecord::Migration
  def change
    change_column :loi_forms, :sectors, :string, array: true, default: []
  end
end
