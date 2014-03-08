class Team < ActiveRecord::Base
  has_many :fans, :through => :follows
  has_many :events
end
