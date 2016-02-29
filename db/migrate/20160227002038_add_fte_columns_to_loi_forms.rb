class AddFteColumnsToLoiForms < ActiveRecord::Migration
  def change
    add_column :loi_forms, :actual_staff_total, :integer
    add_column :loi_forms, :current_staff_total, :integer
    add_column :loi_forms, :projected_staff_total, :integer
  end
end
