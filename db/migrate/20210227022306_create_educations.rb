class CreateEducations < ActiveRecord::Migration[6.0]
  def change
    create_table :educations do |t|
      t.string :highest_level
      t.string :institution
      t.references :educatable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
