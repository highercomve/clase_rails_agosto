class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :alias
      t.string :twitter_account
      t.string :facebook_account
      t.string :country
      t.string :city
      t.integer :ci
      t.integer :zip_code
      t.boolean :banned

      t.timestamps
    end
  end
end
