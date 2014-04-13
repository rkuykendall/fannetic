class Tier < ActiveRecord::Base
  belongs_to :event
  has_many :tickets
  has_and_belongs_to_many :perks
end
