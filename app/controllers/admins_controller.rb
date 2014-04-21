class AdminsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @teams = Team.find(:all)
  end
end
