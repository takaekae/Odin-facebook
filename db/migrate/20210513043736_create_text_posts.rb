class CreateTextPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :text_posts do |t|
      t.text :body

      t.timestamps
    end
  end
end
