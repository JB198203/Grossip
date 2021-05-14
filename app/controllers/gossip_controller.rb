class GossipController < ApplicationController
  before_action :authenticate_user
  def index
      
      @user = params[:id]
      @gossips = Gossip.all# Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
      
  end

  def show
    @id= params[:id]
    @gossip = Gossip.find(params[:id])
    @comments = Gossip.find(params[:id]).comment
    @comment = Comment.new(content: params['content'], gossip_id: @gossip ,user_id: 1)
    @pre_like = @gossip.likes.find { |like| like.user_id == current_user.id} 
  end

  def new
      @gossip = Gossip.new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create
    
      #@gossip = Gossip.create!(title: params['title'], content: params['content'], user_id: 1) #user_id à configurer 
        @gossip = Gossip.new(title: params['title'], content: params['content']) # avec xxx qui sont les données obtenues à partir du formulaire
        @gossip.user = User.find_by(id: session[:user_id])
        if @gossip.save # essaie de sauvegarder en base @gossip
          flash[:success] = "Gossip bien créé!"
          redirect_to gossip_index_path
          
          
          # si ça marche, il redirige vers la page d'index du site
        else
          flash[:danger] = "Nous n'avons pas réussi à créer le potin pour la (ou les) raison(s) suivante(s) : #{@gossip.errors.full_messages.join(" , ")}"
          render new_gossip_path
          # sinon, il render la view new (qui est celle sur laquelle on est déjà)
        end
    
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)
  end

  def edit
    @gossip = Gossip.find(params[:id])
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
      @gossip = Gossip.find(params[:id])
      post_params = params.require(:gossip).permit(:title, :content)
    
        if  @gossip.user.id != current_user.id
          flash[:danger] = "Vous n'êtes pas autorisé à modifier ce Gossip "
          redirect_to @gossip
        elsif @gossip.update(post_params)
          flash[:success] = "Gossip bien modifié!"
          redirect_to @gossip
        else
          flash[:danger] = "Nous n'avons pas réussi à modifier le potin pour la (ou les) raison(s) suivante(s) : #{@gossip.errors.full_messages.join(" , ")}"
          render :edit
        end
        
      
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    
    if  @gossip.user.id != current_user.id
      flash[:danger] = "Vous n'êtes pas autorisé à supprimer ce Gossip "
          redirect_to @gossip
    elsif @gossip.destroy
    flash[:success] = "Gossip bien supprimé!"
    redirect_to gossip_index_path
    else
    flash[:danger] = "Nous n'avons pas réussi à modifier le potin pour la (ou les) raison(s) suivante(s) : #{@gossip.errors.full_messages.join(" , ")}"
    redirect_to gossip_index_path
    end
  end
end



private

  def authenticate_user
    unless current_user
      flash[:danger] = "Connectez-vous pour continuer"
      redirect_to welcome_index_path
    end
  end