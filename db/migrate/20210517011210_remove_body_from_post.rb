class RemoveBodyFromPost < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :body
  end
end
