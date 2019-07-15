class AddUserToMypage < ActiveRecord::Migration[5.2]
  def change
    add_reference :mypages, :user, foreign_key: true
  end
end
