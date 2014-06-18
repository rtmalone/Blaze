class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :date
      t.string :name
      t.string :length
      t.string :state
      t.string :city
      t.string :notes
      t.string :lat
      t.string :lon

      t.timestamps
    end
  end
end
