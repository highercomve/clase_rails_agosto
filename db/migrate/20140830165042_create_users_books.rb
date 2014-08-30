class CreateUsersBooks < ActiveRecord::Migration
  def change
    create_table :books_users do |t|
      t.references :user, index: true
      t.references :book, index: true
    end
  end
end
