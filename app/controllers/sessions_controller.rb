class SessionsController < ApplicationController

  def new
    @current_user = nil
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      flash[:success] = "Authentification réussie!"
      session[:user_id] = user.id
      redirect_to gossip_index_path
    else 
      flash.now[:danger]= "Combinaison email/mot de passe incorrecte"
      render 'new'
    end
  end

  def destroy
  
    log_out
    
  end
end
