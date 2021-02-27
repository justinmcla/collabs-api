class CreateLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :languages do |t|
      t.string :lang
      t.string :proficiency
      t.references :languageable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
