class TiersController < ApplicationController
  before_filter :authenticate_admin!

  def new
    @team = Team.find(params[:team_id])
    @event = Event.find(params[:event_id])
    @tier = Tier.new
  end

  def create
    @team = Team.find(params[:team_id])
    @event = Event.find(params[:event_id])
    @tier = Tier.new(params[:tier].permit(:price, :deadline, :purchase_limit))
    @event.tiers << @tier
    @tier.save
    redirect_to team_event_path(@team, @event)
  end

  def update
    @tier = Tier.find(params[:id])
    @team = Team.find(params[:team_id])
    @event = Event.find(params[:event_id])
    
    if @tier.update(params[:tier].permit(:price, :deadline, :purchase_limit))
      redirect_to team_event_path(@team, @event)
    else
      render 'edit'
    end
  end

  def edit
    @tier = Tier.find(params[:id])
    @team = Team.find(params[:team_id])
    @event = Event.find(params[:event_id])
  end

  def destroy
    @tier = Tier.find(params[:id])
    @tier.destroy
    
    @event = Event.find(params[:event_id])

    redirect_to team_event_path(@event)
  end
end