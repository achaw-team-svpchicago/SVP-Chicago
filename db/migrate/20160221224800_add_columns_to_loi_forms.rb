class AddColumnsToLoiForms < ActiveRecord::Migration
  def change
    add_column :loi_forms, :organization, :string
    add_column :loi_forms, :address, :string
    add_column :loi_forms, :phone, :string
    add_column :loi_forms, :website, :string
    add_column :loi_forms, :executive, :string
    add_column :loi_forms, :executive_phone, :string
    add_column :loi_forms, :executive_email, :string
    add_column :loi_forms, :contact, :string
    add_column :loi_forms, :contact_phone, :string
    add_column :loi_forms, :contact_email, :string
  end
end
