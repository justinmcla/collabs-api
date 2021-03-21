class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :employer
      t.datetime :start_date
      t.datetime :end_date
      t.references :jobable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
