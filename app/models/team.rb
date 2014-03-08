class Team < ActiveRecord::Base
  has_many :fans, :through => :loves
  has_many :events
end
