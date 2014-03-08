class AddMoreInfoToFans < ActiveRecord::Migration
  def change
    add_column :fans, :name, :string
    add_column :fans, :nickname, :string
    add_column :fans, :first_name, :string
    add_column :fans, :last_name, :string
    add_column :fans, :image, :string
    add_column :fans, :location, :string
    add_column :fans, :hometown, :string
    add_column :fans, :gender, :string
    add_column :fans, :urls, :string
    add_column :fans, :verified, :string
    add_column :fans, :timezone, :string
    add_column :fans, :locale, :string
    add_column :fans, :expires, :string
    add_column :fans, :expires_at, :datetime
  end
end
