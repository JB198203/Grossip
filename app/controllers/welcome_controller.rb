class WelcomeController < ApplicationController
  def index
    @user = params[:id]
    @gossips = Gossip.all
    
  end

end