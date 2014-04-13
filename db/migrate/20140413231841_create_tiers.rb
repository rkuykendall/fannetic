class CreateTiers < ActiveRecord::Migration
  def change
    create_table :tiers do |t|
      t.integer :price
      t.datetime :deadline
      t.integer :purchase_limit

      t.timestamps
    end
    
    create_table :tiers_perks, id: false do |t|
      t.belongs_to :tier
      t.belongs_to :perk
    end
  end
end
