class Owner < ApplicationRecord
  has_many :ownerships
  has_many :dogs, through: :ownerships

  # def all_dog_names
  #   Dog.order(:name)
  # end
end
