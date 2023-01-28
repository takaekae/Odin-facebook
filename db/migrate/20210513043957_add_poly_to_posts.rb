class AddPolyToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :postable, polymorphic: true
  end
end
