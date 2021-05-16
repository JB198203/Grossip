class CommentController < ApplicationController
  before_action :authenticate_user
  def index
  end

  def show
    @id= params[:id]
  end

  def new
    @comment = Comment.new
    @gossip = params[:id]

  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create

    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(content: params[:content],gossip: @gossip)
    @comment.user = User.find_by(id: session[:user_id])
    if @comment.save
      flash[:success] = "Comment successfully added! 👍"
      redirect_to gossip_path(@gossip.id)
    else
     redirect_to gossip_path(@gossip.id)
   end
    #ossip = Gossip.find(params[:gossip_id])
    #omment = Comment.new(content: params['content'], gossip_id: @gossip ,user_id: 1) # avec xxx qui sont les données obtenues à partir du formulaire
    #
    #  if @comment.save # essaie de sauvegarder en base @gossip
    #    flash[:success] = "commentaire bien créé!"
    #    redirect_to welcome_path
  
    #    # si ça marche, il redirige vers la page d'index du site
    #  else
    #    flash[:danger] = "Nous n'avons pas réussi à créer le commentaire pour la (ou les) raison(s) suivante(s) : #{@comment.errors.full_messages.join(" , ")}"
    #  
    #    # sinon, il render la view new (qui est celle sur laquelle on est déjà)
    #  end
  end

  def update
    @comment = Comment.find(params[:id])
    @gossip = Gossip.find(params[:gossip_id])
    
    if @comment.update(content: params[:content])  
      flash[:success] = "Gossip successfully modified! 👍"
      redirect_to gossip_path(@gossip.id)
    else
      redirect_to gossip_path(@gossip.id)
    end
  end
  
  def destroy
  #  @gossip = Gossip.find(params[:gossip_id])
  #  @comment = Comment.find(params[:id])
  #  
  #  
  #  @comment.destroy
  #  flash[:alert] = "Comment deleted! 🗑️"
  #  redirect_to gossip_path(@gossip.id)
  end
end
