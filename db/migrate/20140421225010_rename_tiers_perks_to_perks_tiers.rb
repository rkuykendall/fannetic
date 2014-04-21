class RenameTiersPerksToPerksTiers < ActiveRecord::Migration
  def change
    rename_table :tiers_perks, :perks_tiers
  end
end
