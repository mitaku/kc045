class Profile < ActiveRecord::Base
  attr_accessible :name, :phonetic_name, :twitter, :blog, :hometown, :comment
end
