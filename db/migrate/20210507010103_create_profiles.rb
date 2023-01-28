class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.text :intro
      t.string :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
