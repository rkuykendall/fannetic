class Follow < ActiveRecord::Base
  belongs_to :fan
  belongs_to :team
end
