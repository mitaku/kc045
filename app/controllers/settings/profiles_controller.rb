class Settings::ProfilesController < ApplicationController
  before_filter :login_required
  before_filter :set_resource

  def show
  end

  def edit
  end

  def update
    if @profile.update_attributes(params[:profile])
      redirect_to(:action => :show)
    else
      render :action => "edit"
    end
  end


  private
    def set_resource
      @profile = current_user.profile
    end
end
