class AddTierToTickets < ActiveRecord::Migration
  def change
    add_reference :tickets, :tier, index: true
  end
end
