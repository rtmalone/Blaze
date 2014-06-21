class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :attachment
      t.integer :entry_id

      t.timestamps
    end
  end
end
