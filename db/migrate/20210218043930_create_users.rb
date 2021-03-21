class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :sub, null: false
      t.timestamps
    end
  end
end
