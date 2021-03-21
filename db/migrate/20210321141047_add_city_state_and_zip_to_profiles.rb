class AddCityStateAndZipToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :city, :string
    add_column :profiles, :state, :string
    add_column :profiles, :zip, :string
  end
end
