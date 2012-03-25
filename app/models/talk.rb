class Talk < ActiveRecord::Base
  attr_accessible :title, :slide

  belongs_to :user

  validates :title, :presence => true, :length => {:maximum => 200}
end
