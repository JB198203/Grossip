class LikesController < ApplicationController
  before_action :find_like, only: [:destroy]
  def index
  end

  def new
    @like= Like.new
  end

  def create
    @gossip = Gossip.find(params[:gossip_id])
    
    @like = Like.new(gossip_id:@gossip.id,comment_id: params['comment_id'])
    @like.user = current_user
    if @like.save
      flash[:success] = "Merci pour ton like 👍"
      redirect_to request.referrer
    #else
    #  flash[:danger]= "oups, il y eu un couac !"
    #  redirect_to action: "destroy"
    #  @like.destroy
    ##1redirect_to request.referrer
   end
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Impossible de délike."
    else
      @like.destroy
    end
      redirect_to request.referrer
  end 
  
  
end

private
def already_liked?
  Like.where(user_id: current_user.id, gossip_id:
  params[:gossip_id]).exists?
end

def find_like
  @gossip = Gossip.find(params[:gossip_id])
  @like = @gossip.likes.find(params[:id])
end