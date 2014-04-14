class Event < ActiveRecord::Base
  belongs_to :team
  has_many :tiers
  has_many :tickets, :through => :tiers
  has_and_belongs_to_many :perks
end
