class TricksController < ApplicationController
  def index
    @dog_id = params[:dog_id]
  end

  def new
    require "pry"; binding.pry
    @dog_id = params[:dog_id]
  end

  def create
    @dog_id = params[:dog_id]
    render 'tricks/create'
  end
end
