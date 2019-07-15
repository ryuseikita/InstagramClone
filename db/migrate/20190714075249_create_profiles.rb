class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.text :image
      t.string :profile
      t.integer :user_id

      t.timestamps
    end
  end
end
