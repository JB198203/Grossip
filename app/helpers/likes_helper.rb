module LikesHelper
  def already_liked?
    Like.where(user_id: current_user.id, gossip_id:
    params[:gossip_id]).exists?
  end
end
