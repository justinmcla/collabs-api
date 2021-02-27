class CreateSocialLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :social_links do |t|
      t.string :handle
      t.string :provider
      t.references :linkable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
