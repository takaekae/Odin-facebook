class CreateFriendRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.references :requesting_friend, references: :user
      t.references :requested_friend, references: :user

      t.timestamps
    end

    
  end
end
