class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :fan, index: true
      t.references :event, index: true

      t.timestamps
    end
  end
end
