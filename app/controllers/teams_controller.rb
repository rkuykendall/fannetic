class TeamsController < ApplicationController
  before_filter :authenticate_fan!, :except => [:index, :show]
  before_filter :authenticate_admin!, :except => [:index, :show]
  
  def index
    @teams = Team.find(:all)
  end

  def show
    @team = Team.find(params[:id])
    @events = @team.events
    @fans = @team.fans
    @follow = Follow.find_by_fan_id(current_fan)
  end
  
  def new
    @team = Team.new
  end
  
  def create
    @team = Team.new(params[:team].permit(:title))
    @team.save
    redirect_to @team
  end
  
  def edit
    @team = Team.find(params[:id])
  end
  
  def update
  	@team = Team.find(params[:id])
  
  	if @team.update(params[:team].permit(:title))
  		redirect_to @team
  	else
  		render 'edit'
  	end
  end
  
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    redirect_to teams_path
  end

end
