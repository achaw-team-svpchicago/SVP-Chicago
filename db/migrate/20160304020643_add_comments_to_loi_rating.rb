class AddCommentsToLoiRating < ActiveRecord::Migration
  def change
    add_column :loi_ratings, :comment, :string
  end
end
