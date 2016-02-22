class AddMoreColumnsToLoiForm < ActiveRecord::Migration
  def change
    add_column :loi_forms, :mission, :text
    add_column :loi_forms, :vision, :text
    add_column :loi_forms, :concerns, :text

    add_column :loi_forms, :actual_staff_board, :integer
    add_column :loi_forms, :current_staff_board, :integer
    add_column :loi_forms, :projected_staff_board, :integer
    add_column :loi_forms, :board_challenge_1, :string
    add_column :loi_forms, :board_1_priority, :string
    add_column :loi_forms, :board_challenge_2, :string
    add_column :loi_forms, :board_2_priority, :string
    add_column :loi_forms, :board_challenge_3, :string
    add_column :loi_forms, :board_3_priority, :string

    add_column :loi_forms, :actual_staff_operations, :integer
    add_column :loi_forms, :current_staff_operations, :integer
    add_column :loi_forms, :projected_staff_operations, :integer
    add_column :loi_forms, :operations_challenge_1, :string
    add_column :loi_forms, :operations_1_priority, :string
    add_column :loi_forms, :operations_challenge_2, :string
    add_column :loi_forms, :operations_2_priority, :string
    add_column :loi_forms, :operations_challenge_3, :string
    add_column :loi_forms, :operations_3_priority, :string

    add_column :loi_forms, :actual_staff_fund, :integer
    add_column :loi_forms, :current_staff_fund, :integer
    add_column :loi_forms, :projected_staff_fund, :integer
    add_column :loi_forms, :fund_challenge_1, :string
    add_column :loi_forms, :fund_1_priority, :string
    add_column :loi_forms, :fund_challenge_2, :string
    add_column :loi_forms, :fund_2_priority, :string
    add_column :loi_forms, :fund_challenge_3, :string
    add_column :loi_forms, :fund_3_priority, :string

    add_column :loi_forms, :actual_staff_marketing, :integer
    add_column :loi_forms, :current_staff_marketing, :integer
    add_column :loi_forms, :projected_staff_marketing, :integer
    add_column :loi_forms, :marketing_challenge_1, :string
    add_column :loi_forms, :marketing_1_priority, :string
    add_column :loi_forms, :marketing_challenge_2, :string
    add_column :loi_forms, :marketing_2_priority, :string
    add_column :loi_forms, :marketing_challenge_3, :string
    add_column :loi_forms, :marketing_3_priority, :string

    add_column :loi_forms, :actual_staff_strategic, :integer
    add_column :loi_forms, :current_staff_strategic, :integer
    add_column :loi_forms, :projected_staff_strategic, :integer
    add_column :loi_forms, :strategic_challenge_1, :string
    add_column :loi_forms, :strategic_1_priority, :string
    add_column :loi_forms, :strategic_challenge_2, :string
    add_column :loi_forms, :strategic_2_priority, :string
    add_column :loi_forms, :strategic_challenge_3, :string
    add_column :loi_forms, :strategic_3_priority, :string

    add_column :loi_forms, :actual_staff_technology, :integer
    add_column :loi_forms, :current_staff_technology, :integer
    add_column :loi_forms, :projected_staff_technology, :integer
    add_column :loi_forms, :technology_challenge_1, :string
    add_column :loi_forms, :technology_1_priority, :string
    add_column :loi_forms, :technology_challenge_2, :string
    add_column :loi_forms, :technology_2_priority, :string
    add_column :loi_forms, :technology_challenge_3, :string
    add_column :loi_forms, :technology_3_priority, :string

    add_column :loi_forms, :actual_staff_other, :integer
    add_column :loi_forms, :current_staff_other, :integer
    add_column :loi_forms, :projected_staff_other, :integer
    add_column :loi_forms, :other_challenge_1, :string
    add_column :loi_forms, :other_1_priority, :string
    add_column :loi_forms, :other_challenge_2, :string
    add_column :loi_forms, :other_2_priority, :string
    add_column :loi_forms, :other_challenge_3, :string
    add_column :loi_forms, :other_3_priority, :string

    add_column :loi_forms, :additional, :text
    add_column :loi_forms, :referral, :text
    add_column :loi_forms, :sectors, :string
    add_column :loi_forms, :other_sectors, :string
    add_column :loi_forms, :geo_focus, :string
    add_column :loi_forms, :other_geo_focus, :string

  end
end
