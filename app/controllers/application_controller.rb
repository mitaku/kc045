class ApplicationController < ActionController::Base
  protect_from_forgery


  rescue_from(ActiveRecord::RecordNotFound, :with => :render_404)
  rescue_from(ActionController::UnknownAction, :with => :render_404)
  rescue_from(ActionController::InvalidAuthenticityToken, :with => :render_422)

  helper_method :current_user, :signed_in?
  protected
  def login_required
    unless signed_in?
      redirect_to root_path# please sign in
    end
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def current_user=(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def signed_in?
    !!current_user
  end

  def render_404
    render_error(404)
  end

  def render_422
    render_error(422)
  end

  def render_500
    render_error(500)
  end

  def render_error(status_code)
    render :file => "#{Rails.root}/public/#{status_code}.html", :status => status_code
  end
end
