class Settings::TalksController < ApplicationController
  before_filter :login_required
  before_filter :set_resource

  def show
  end

  def edit
  end

  def update
    if @talk.update_attributes(params[:talk])
      redirect_to(:action => :show)
    else
      flash.now[:errors] = @talk.errors.full_messages
      render :action => "edit"
    end
  end


  private
    def set_resource
      @talk = current_user.talk
    end
end
