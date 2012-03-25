# -*- coding: utf-8 -*-

if Rails.env.production?
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  end
end
