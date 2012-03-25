# -*- coding: utf-8 -*-

class User < ActiveRecord::Base

  has_one :talk, :dependent => :destroy
  has_one :profile, :dependent => :destroy

  after_create do
    #create_talk
    self.create_talk! do |obj|
      obj.time = 5 * 60
      obj.title = self.screen_name + "さんの発表"
    end
    #create_profile
    self.create_profile! do |obj|
      obj.twitter = self.screen_name
      obj.name = self.name
    end
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.screen_name = auth['info']['nickname']
      user.name = auth['info']['name']
      user.email = auth['info']['email']
      user.image = auth['info']['image']
    end
  end
end
