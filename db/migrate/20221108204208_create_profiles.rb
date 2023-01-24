class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :age
      t.string :location
      t.string :picture

      t.timestamps
    end
  end
end
