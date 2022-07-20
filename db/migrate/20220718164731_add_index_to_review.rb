class AddIndexToReview < ActiveRecord::Migration[5.2]
  def change
    add_index :reviews, :user_id, unique: true
  end
end
