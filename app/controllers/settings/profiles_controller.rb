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
      flash.now[:errors] = @profile.errors.full_messages
      render :action => "edit"
    end
  end

  def destroy
    session[:user_id] = nil
    current_user.destroy

    redirect_to root_path, :flash => {:notice => I18n.t("settings.profiles.destroyed")}
  end


  private
    def set_resource
      @profile = current_user.profile
    end
end
