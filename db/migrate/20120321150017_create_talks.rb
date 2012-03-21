class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string   "title"
      t.integer  "time"
      t.string   "slide"
      t.integer :user_id
      t.timestamps
    end

    add_index :talks, :user_id
  end
end
