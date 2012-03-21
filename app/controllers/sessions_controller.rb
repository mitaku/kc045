# -*- coding: utf-8 -*-
#
class SessionsController < ApplicationController
  def callback
    auth = request.env['omniauth.auth']
    if user = User.find_by_provider_and_uid(auth['provider'], auth['uid'])
    else
      user = User.create_with_omniauth(auth)
      # access token
    end
    session[:user_id] = user.id
    redirect_to root_path, :notice => "Login"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Logout"
  end
end
