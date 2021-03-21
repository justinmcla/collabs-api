class AddUrlToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :url, :string
  end
end
