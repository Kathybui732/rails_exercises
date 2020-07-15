class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end

  def new
    @dog = Dog.find(params[:dog_id])
  end

  def create
    dog = Dog.find(params[:dog_id])
    new_owner = Owner.create(owner_params)
    new_owner.ownerships.create(dog: dog, length: params[:length])
    if new_owner.save
      redirect_to "/owners"
    end
  end

  def adoption
    @owner = Owner.find(params[:owner_id])
    @dogs = Dog.all
  end

  def adopt
    dog = Dog.find(params[:dog_id])
    owner = Owner.find(params[:owner_id])
    owner.ownerships.create(dog: dog, length: 0)
    redirect_to "/owners"
  end

  def adopt_from_list
    owner = Owner.find(params[:owner_id])
    dog_names = params[:dogs].strip.split(",")
    dog_names.each do |dog_name|
      owner.ownerships.create(dog: Dog.where(name: dog_name), length: 0)
    end
    redirect_to "/owners"
  end

  private
  def owner_params
    params.permit(:name)
  end
end
