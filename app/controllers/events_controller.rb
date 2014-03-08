class EventsController < ApplicationController
  def index
    @events = Event.find(:all)
  end

  def show
    @event = Event.find(params[:id])
  end
  
  def new
    @event = Event.new
    @teams = Team.find(:all)
  end
  
  def create
    @event = Event.new(params[:event].permit(:title, :text))
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
  	@post = Post.find(params[:id])
   
  	if @post.update(params[:post].permit(:title, :text))
  		redirect_to @post
  	else
  		render 'edit'
  	end
  end
  
end
