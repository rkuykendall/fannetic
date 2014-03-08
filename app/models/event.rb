class Event < ActiveRecord::Base
  belongs_to :team
  has_many :fans, :through => :tickets
end
