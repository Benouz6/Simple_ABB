class AddUserToReview < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :user, :string
  end
end
