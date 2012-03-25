class Profile < ActiveRecord::Base
  belongs_to :user

  attr_accessible :name, :phonetic_name, :blog, :hometown, :comment

  validates :name, :presence => true, :length => {:maximum => 60}
  validates :phonetic_name, :length => {:maximum => 60}
  validates :blog, :length => {:maximum => 200}
  validates :comment, :length => {:maximum => 140}
end
