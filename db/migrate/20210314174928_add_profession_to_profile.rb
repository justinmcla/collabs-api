class AddProfessionToProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :profession, :string
  end
end
