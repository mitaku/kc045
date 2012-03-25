class Settings::ProfilesController < ApplicationController
  before_filter :login_required
  before_filter :set_resource

  def show
  end

  def edit
  end

  def update
  end


  private
    def set_resource
      @profile = current_user.profile
    end
end
