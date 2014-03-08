class AddColumnsToFans < ActiveRecord::Migration
  def change
    add_column :fans, :provider, :string
    add_column :fans, :uid, :string
  end
end
