class TicketsController < ApplicationController
  before_filter :authenticate_fan!, :except => [:index, :show]

  def index
    if params[:fan_id]
      # /fan/1/tickets
      @fan = Fan.find(params[:fan_id])
      @tickets = Ticket.find_all_by_fan_id(@fan)
    else
      # event/1/tickets
      @fan = current_fan
      @event = Event.find(params[:event_id])
      @tickets = Ticket.find_all_by_fan_id_and_event_id(@fan,@event)
    end    
  end

  def show
    @ticket = Ticket.find(params[:id])
    @fan = @ticket.fan
    @event = @ticket.event
    @team = @event.team
  end
  
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

    customer = Stripe::Customer.create(
      :email => current_fan.email,
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @event.price,
      :description => 'Ticket '+@ticket.id.to_s,
      :currency    => 'usd'
    )
    
    flash[:notice] = "Ticket successfully created!"
    redirect_to fan_tickets_path(current_fan)

  rescue Stripe::CardError => e
    @ticket.destroy
    
    flash[:error] = e.message
    redirect_to team_event_path(@team, @event)
  end

  def destroy
  end
end
