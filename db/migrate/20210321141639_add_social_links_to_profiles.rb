class AddSocialLinksToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :facebook, :string
    add_column :profiles, :github, :string
    add_column :profiles, :instagram, :string
    add_column :profiles, :linkedin, :string
    add_column :profiles, :medium, :string
    add_column :profiles, :twitter, :string
    add_column :profiles, :youtube, :string
    add_column :profiles, :twitch, :string
  end
end
