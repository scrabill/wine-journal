class AddUserIdToBottles < ActiveRecord::Migration
  def change
    add_column :bottles, :user_id, :string
  end
end
