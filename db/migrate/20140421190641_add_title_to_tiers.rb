class AddTitleToTiers < ActiveRecord::Migration
  def change
    add_column :tiers, :title, :string
  end
end
