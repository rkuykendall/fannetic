class FansController < ApplicationController
  def show
    @fan = Fan.find(params[:id])
  end
end
