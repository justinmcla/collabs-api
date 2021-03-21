class DropObsoleteTables < ActiveRecord::Migration[6.0]
  def change
    drop_table :educations
    drop_table :jobs
    drop_table :languages
  end
end
