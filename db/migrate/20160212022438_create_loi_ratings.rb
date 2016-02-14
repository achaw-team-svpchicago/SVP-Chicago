class CreateLoiRatings < ActiveRecord::Migration
  def change
    create_table :loi_ratings do |t|
      t.integer :user_id
      t.integer :loi_form_id
      t.integer :q1_rating
      t.integer :q2_rating
      t.integer :q3_rating
      t.integer :q4_rating
      t.string :q5_rating

      t.timestamps null: false
    end
  end
end
