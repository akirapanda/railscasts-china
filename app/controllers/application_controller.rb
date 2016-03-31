class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :user_signed_in?
  helper_method :correct_user?
  helper_method :admin_users?

private
  def admin_required
    if !current_user.try(:admin?)
      redirect_to root_url, alert: "Contact us for access to this page."
    end
  end

  def admin_users?
    return current_user.try(:admin)
  end

  def user_signed_in?
    return true if current_user
  end

  def correct_user?
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to root_url, :alert => "Access denied."
    end
  end

  def authenticate_user!
    if !current_user
      redirect_to root_url, :alert => 'You need to sign in for access to this page.'
    end
  end
end
