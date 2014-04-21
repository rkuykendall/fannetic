class EventsController < ApplicationController
  before_filter :authenticate_fan!, :except => [:index, :show]
  before_filter :authenticate_admin!, :only =>  [:index, :show]
  
  def index
    @teams = Team.find(:all)
    @events = Event.find(:all)
#     for event in @events do
#       if current_fan in event.fans
#         flash[:notice] = "True"
#       end
#     end
  end

  def show
    @event = Event.find(params[:id])
    @team = Team.find(params[:team_id])
  end
  
  def new
    @event = Event.new
    @team = Team.find(params[:team_id])
  end
  
  def create
    @team = Team.find(params[:team_id])
    @event = Event.new(params[:event].permit(:title, :location, :start, :end, :body))
    @event.team_id = @team.id
    @event.save
    redirect_to admins_path
  end
  
  def edit
    @event = Event.find(params[:id])
    @team = @event.team
  end
  
  def update
  	@event = Event.find(params[:id])
    @team = @event.team
  
  	if @event.update(params[:event].permit(:title, :location, :start, :end, :body))
      redirect_to admins_path
  	else
  		render 'edit'
  	end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to admins_path
  end
end


