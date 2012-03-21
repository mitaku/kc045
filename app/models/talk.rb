class Talk < ActiveRecord::Base
  attr_accessible :title, :slide

  belongs_to :user
end
