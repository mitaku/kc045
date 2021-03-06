# -*- coding: utf-8 -*-

class User < ActiveRecord::Base

  has_one :talk, :dependent => :destroy
  has_one :profile, :dependent => :destroy

  LIMIT = 40

  class LimitOverException < ::StandardError; end

  before_create do
    raise LimitOverException if User.count >= LIMIT
    true
  end

  after_create do
    #create_talk
    self.create_talk! do |obj|
      obj.time = 0 * 60 #発表時間が増やせないので０分で登録
      obj.title = self.screen_name + "さんの発表"
    end
    #create_profile
    self.create_profile! do |obj|
      obj.twitter = self.screen_name
      obj.name = self.name
    end
  end

  def self.create_with_omniauth(auth)
    create do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.screen_name = auth['info']['nickname']
      user.name = auth['info']['name']
      user.email = auth['info']['email']
      user.image = auth['info']['image']
    end
  end

  def display_name
    self.profile.try(:name) || self.name
  end
end
