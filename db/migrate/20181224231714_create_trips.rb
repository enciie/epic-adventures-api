class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :name
      t.text :description
      t.string :location
      t.string :img_url

      t.timestamps
    end
  end
end
