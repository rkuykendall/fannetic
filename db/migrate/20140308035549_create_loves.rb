class CreateLoves < ActiveRecord::Migration
  def change
    create_table :loves do |t|
      t.references :fan, index: true
      t.references :team, index: true

      t.timestamps
    end
  end
end
