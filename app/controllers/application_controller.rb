class ApplicationController < ActionController::Base
  before_action :authorize
  before_action :set_user

  include CurrentCart
  before_action :set_cart

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def authorize
    unless user = User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "Please log in"
    #else
      #unless user.role == 'admin'
      #  raise ActiveRecord::RecordNotFound
      #end
    end
  end

  def set_user
    @user = User.find_by(id: session[:user_id])
  end

end
