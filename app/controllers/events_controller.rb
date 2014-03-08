class EventsController < ApplicationController
  def index
    @name = "Robert"
  end
  
  def create
    render text: params[:event].inspect
  end
  
end
