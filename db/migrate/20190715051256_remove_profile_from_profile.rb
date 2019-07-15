class RemoveProfileFromProfile < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :profile, :string
  end
end
