class FollowsController < ApplicationController
  before_filter :authenticate_fan!
  
  def create
    @follow = Follow.new
    @follow.team_id = params[:team_id]
    @follow.fan_id = current_fan.id
    @follow.save
    
    redirect_to team_path(:id => params[:team_id])
  end

  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy

    redirect_to team_path(:id => params[:team_id])
  end
end
