class ChangeLoiIdToLoiFormIdInAnswer < ActiveRecord::Migration
  def change
    rename_column :answers, :loi_id, :loi_form_id
  end
end
