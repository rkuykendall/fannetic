class TicketsController < ApplicationController
  def new
    @team = Team.find(params[:team_id])
    @event = Event.find(params[:event_id])
  end

  def create
    @team = Team.find(params[:team_id])
    @event = Event.find(params[:event_id])
    
    @ticket = Ticket.new()
    @ticket.event_id = @event.id
    @ticket.fan_id = current_fan.id
    @ticket.save
    flash[:notice] = "Ticket successfully created"
    redirect_to fan_tickets_path(current_fan)
  end

  def destroy
  end

  def index
    @tickets = Ticket.find_all_by_fan_id(params[:fan_id])
  end

  def show
    @ticket = Ticket.find(params[:id])
    @fan = @ticket.fan
    @event = @ticket.event
    @team = @event.team
  end
end
