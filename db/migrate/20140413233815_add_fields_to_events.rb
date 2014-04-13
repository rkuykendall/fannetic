class AddFieldsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :purchase_limit, :integer
    add_column :events, :host_address, :string
    add_column :events, :host_website, :string
    add_column :events, :published, :boolean
    remove_column :events, :price
  end
end
