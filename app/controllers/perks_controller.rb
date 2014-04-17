class PerksController < ApplicationController
  before_filter :authenticate_admin!

  def new
    @team = Team.find(params[:team_id])
    @event = Event.find(params[:event_id])
    @perk = Perk.new
  end

  def create
    @team = Team.find(params[:team_id])
    @event = Event.find(params[:event_id])
    @perk = Perk.new(params[:perk].permit(:title, :body, :tickets_required))
    @event.perks << @perk
    @perk.save
    redirect_to team_event_path(@team, @event)
  end

  def update
    @perk = Perk.find(params[:id])
    @team = Team.find(params[:team_id])
    @event = Event.find(params[:event_id])
    
    if @perk.update(params[:perk].permit(:title, :body, :tickets_required))
      redirect_to team_event_path(@team, @event)
    else
      render 'edit'
    end
  end

  def edit
    @perk = Perk.find(params[:id])
    @team = Team.find(params[:team_id])
    @event = Event.find(params[:event_id])
  end

  def destroy
    @perk = Perk.find(params[:id])
    @perk.destroy
    
    @event = Event.find(params[:event_id])

    redirect_to team_event_path(@event)
  end
end
