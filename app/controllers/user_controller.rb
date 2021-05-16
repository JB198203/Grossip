class UserController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end  
  def create
    @user = User.new(first_name: params['first_name'], last_name: params['last_name'], email: params['email'], description: params['description'], password: params['password'], city_id: 1, age: params[:age]) 
    #CITY_ID A CHANGER CAR DÉFAUT = 1
    # avec xxx qui sont les données obtenues à partir du formulaire
    
    if @user.save # essaie de sauvegarder en base 
      flash[:success] = "Votre inscription a bien été prise en compte!"
      log_in(@user)
      redirect_to gossip_index_path
      
      # si ça marche, il redirige vers la page d'index du site
    else
      flash[:danger] = "Nous n'avons pas réussi à finaliser votre inscription pour la (ou les) raison(s) suivante(s) : #{@user.errors.full_messages.join(" , ")}"
      render new_user_path
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
    end
  end
end
