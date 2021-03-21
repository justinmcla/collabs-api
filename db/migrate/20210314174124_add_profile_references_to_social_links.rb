class AddProfileReferencesToSocialLinks < ActiveRecord::Migration[6.0]
  def change
    add_reference :social_links, :profile, null: false, foreign_key: true
  end
end
