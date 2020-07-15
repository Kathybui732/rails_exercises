class TricksController < ApplicationController

  def index
    @dog = Dog.find(params[:dog_id])
    @tricks = @dog.tricks
  end

  def new
    @dog = Dog.find(params[:dog_id])
  end

  def create
    dog = Dog.find(params[:dog_id])
    new_trick = dog.tricks.create(trick_params)
    if new_trick.save
      redirect_to "/dogs/#{dog.id}/tricks"
    end
  end

  private
  def trick_params
    params.permit(:title)
  end
end
