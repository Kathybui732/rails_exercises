class Dog < ApplicationRecord
  validates_numericality_of :age, greater_than_or_equal_to: 0
  validates_presence_of :name, :breed, :age

  has_many :tricks
  has_many :ownerships
  has_many :owners, through: :ownerships

  def number_of_tricks
    self.tricks.count
  end

  def self.average_age
    average(:age)
  end

  def self.by_breed(breed)
    # select * from dogs where breed = 'breed'
    Dog.where(breed: breed)
  end

  def self.breeds
    # select breed from dogs;
    Dog.pluck(:breed)
  end

  def self.unique_breeds
    # select distinct breed from dogs;
    Dog.distinct.pluck(:breed)
    # self.breeds.uniq
  end

  def self.age_greater_than(age)
    # select * from dogs where age > 3;
    Dog.where('age > ?', age)
  end

  def self.sort_by_name
    # select * from dogs order by name;
    Dog.order(:name)
  end

  def self.sort_by_name_reverse
    # select * from dogs order by name desc;
    Dog.order(name: :desc)
  end

  def alphabetical_tricks
    # select * from tricks order by title;
    self.tricks.order(:title)
  end

  def alphabetical_tricks_limit(number)
    # select * from tricks order by title limit 2;
    self.tricks.order(:title).limit(number)
  end

  def self.owned_more_than_3_years
    # select * from dogs join ownerships on dogs.id = ownerships.dog_id where ownerships.length > 3;
    Dog.joins(:ownerships).where('ownerships.length > ?', 3)
  end
end
