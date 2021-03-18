class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :city
      t.string :state
      t.string :zip
    end
  end
end
