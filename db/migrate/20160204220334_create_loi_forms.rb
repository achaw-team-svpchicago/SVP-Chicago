class CreateLoiForms < ActiveRecord::Migration
  def change
    create_table :loi_forms do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
