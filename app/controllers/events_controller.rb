class EventsController < ApplicationController
  before_filter :authenticate_fan!, :except => [:index, :show]
  before_filter :authenticate_admin!, :only =>  [:index, :show]
  
  def index
    @events = Event.find(:all)
    @teams = Team.find(:all)
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
    @event = Event.new(params[:event].permit(:title, :location, :start, :end, :body, :price))
    @event.team_id = @team.id
    @event.save
    redirect_to team_event_path(@team,@event)
  end
  
  def edit
    @event = Event.find(params[:id])
    @team = @event.team
  end
  
  def update
  	@event = Event.find(params[:id])
    @team = @event.team
  
  	if @event.update(params[:event].permit(:title, :location, :start, :end, :body, :price))
  		redirect_to team_event_path(@team,@event)
  	else
  		render 'edit'
  	end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path
  end
end


