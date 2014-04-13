class CreatePerks < ActiveRecord::Migration
  def change
    create_table :perks do |t|
      t.string :title
      t.string :body
      t.integer :tickets_required

      t.timestamps
    end
    
    create_table :events_perks, id: false do |t|
      t.belongs_to :event
      t.belongs_to :perk
    end
  end
end
