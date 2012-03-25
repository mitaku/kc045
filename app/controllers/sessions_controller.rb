# -*- coding: utf-8 -*-
#
class SessionsController < ApplicationController
  def callback
    auth = request.env['omniauth.auth']
    if user = User.find_by_provider_and_uid(auth['provider'], auth['uid'])
      session[:user_id] = user.id
    else
      begin
        user = User.create_with_omniauth(auth)
        session[:user_id] = user.id
        redirect_to settings_profile_path, :notice => I18n.t("sessions.registered")
        return false
      rescue User::LimitOverException
        redirect_to root_path, :notice => I18n.t("sessions.limit_over")
        return false
      end
    end
    session[:user_id] = user.id
    redirect_to root_path, :notice => "Login"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Logout"
  end
end
