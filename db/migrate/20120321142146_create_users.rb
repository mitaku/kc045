class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   "provider"
      t.string   "uid"
      t.string   "screen_name"
      t.string   "name"
      t.string   "email"
      t.string   "image"
      t.timestamps
    end

    add_index "users", ["uid"], :unique => true
  end
end
