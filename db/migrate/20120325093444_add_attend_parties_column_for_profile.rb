class AddAttendPartiesColumnForProfile < ActiveRecord::Migration
  def up
    add_column :profiles, :attend_parties, :boolean, :default => false
  end

  def down
    remove_column :profiles, :attend_parties
  end
end
