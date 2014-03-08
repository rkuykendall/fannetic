class EventsController < ApplicationController
  def index
    @events = Event.find(:all)
  end

  def show
    @event = Event.find(params[:id])
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(params[:event].permit(:title, :location, :start, :end, :team_id, :body))
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
  	@event = Event.find(params[:id])
  
  	if @event.update(params[:event].permit(:title, :location, :start, :end, :team_id, :body))
  		redirect_to @event
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


