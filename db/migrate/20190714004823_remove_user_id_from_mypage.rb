class RemoveUserIdFromMypage < ActiveRecord::Migration[5.2]
  def change
    remove_column :mypages, :user_id, :integer
  end
end
