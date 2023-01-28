class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.references :user
      t.references :friend, references: :user

      t.timestamps
    end
  end
end
