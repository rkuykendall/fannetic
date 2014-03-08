class TeamsController < ApplicationController
  def index
    @teams = Team.find(:all)
  end

  def show
    @team = Team.find(params[:id])
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

    redirect_to events_path
  end

end
