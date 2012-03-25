class Profile < ActiveRecord::Base
  belongs_to :user

  attr_accessible :name, :phonetic_name, :twitter, :blog, :hometown, :comment
end
