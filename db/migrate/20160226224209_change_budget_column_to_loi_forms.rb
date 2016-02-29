class ChangeBudgetColumnToLoiForms < ActiveRecord::Migration
  def change
    change_column :loi_forms, :budget, :integer
  end
end
