class UpdateUserTable < ActiveRecord::Migration
  def change
    add_column :users, :confirmed, :boolean, :default => false
    change_column_default :users, :admin, true
  end
end
