class CreateEventsTable < ActiveRecord::Migration[4.2]
  def change
    create_table :events do |t|
      t.string :date
      t.integer :artist_id
      t.integer :venue_id
    end
  end
end
