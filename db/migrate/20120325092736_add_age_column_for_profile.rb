class AddAgeColumnForProfile < ActiveRecord::Migration
  def up
    add_column :profiles, :age, :integer
  end

  def down
    remove_column :profiles, :age
  end
end
