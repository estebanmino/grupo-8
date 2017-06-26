module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def is_admin?
    current_user.is_admin
  end

  def user_is_logged?(user)
    if logged_in?
      @current_user.id == user.id
    end
  end

  def is_admin_logged_in?
    if logged_in?
      is_admin?
    end
  end
end
