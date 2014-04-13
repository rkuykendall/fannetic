class AddFieldsToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :count, :integer
    add_column :tickets, :referral_id, :integer
    remove_column :tickets, :event_id
  end
end
