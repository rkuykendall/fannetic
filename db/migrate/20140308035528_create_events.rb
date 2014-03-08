class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :body
      t.string :location
      t.datetime :start
      t.datetime :end
      t.references :team, index: true

      t.timestamps
    end
  end
end
