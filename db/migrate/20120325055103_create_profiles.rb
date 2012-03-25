class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :name
      t.string :phonetic_name
      t.string :twitter
      t.string :blog
      t.string :hometown
      t.text :comment

      t.timestamps
    end
    add_index :profiles, :user_id
  end
end
