class RemoveProfileFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :image, :txt
    remove_column :users, :profile, :string
  end
end
