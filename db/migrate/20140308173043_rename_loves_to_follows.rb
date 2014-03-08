class RenameLovesToFollows < ActiveRecord::Migration
  def change
    rename_table :loves, :follows
  end
end