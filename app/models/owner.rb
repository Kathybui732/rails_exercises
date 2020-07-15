class Owner < ApplicationRecord
  has_many :ownerships
  has_many :dogs, through: :ownerships

  def self.all_dog_names
    # select dogs.name from owners join ownerships on owners.id = ownerships.owner_id join dogs on ownerships.dog_id = dogs.id order by name;
    Owner.joins(:dogs).pluck('dogs.name')
  end

  def self.unique_dog_names
    # select distinct dogs.name from owners join ownerships on owners.id = ownerships.owner_id join dogs on ownerships.dog_id = dogs.id order by name desc;
    Owner.joins(:dogs).pluck('dogs.name').sort.reverse.uniq
  end
end
