class EditColumnToLoiForm < ActiveRecord::Migration
  def change
    change_column :loi_forms, :sectors, "varchar[] USING (string_to_array(sectors, ','))"
  end
end
