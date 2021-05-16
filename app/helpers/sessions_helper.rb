module SessionsHelper
  def current_user
    User.find_by(id: session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    #session.delete(:user_id)
    flash.now[:danger]= "Vous avez été déconnecté(e)"
    reset_session
    @current_user = nil
    redirect_to new_session_path
  end
end
