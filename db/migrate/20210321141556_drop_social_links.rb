class DropSocialLinks < ActiveRecord::Migration[6.0]
  def change
    drop_table :social_links
  end
end
