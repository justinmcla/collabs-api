class CreateCollaborations < ActiveRecord::Migration[6.0]
  def change
    create_table :collaborations do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.boolean :accepted
      t.timestamps
    end
  end
end
