class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :loi_id
      t.text :question
      t.text :answer

      t.timestamps null: false
    end
  end
end
