class Event < ActiveRecord::Base
  belongs_to :team
  has_many :tickets
  has_many :fans, :through => :tickets
end
