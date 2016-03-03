class CreateRfpForms < ActiveRecord::Migration
  def change
    create_table :rfp_forms do |t|
      t.string :organization
      t.string :address
      t.string :organization_phone
      t.string :executive_director
      t.string :executive_director_phone
      t.string :executive_director_email
      t.string :proposal_contact
      t.string :proposal_contact_phone
      t.string :proposal_contact_email
      
      t.integer :loi_forms, :employees
      t.integer :loi_forms, :volunteers
      t.integer :loi_forms, :board
      t.decimal :loi_forms, :budget, precision: 12, scale: 2
      t.string :loi_forms, :affiliated
      t.timestamps null: false
    end
  end
end
