class AddEventLinkToTier < ActiveRecord::Migration
  def change
    add_reference :tiers, :event, index: true
  end
end
