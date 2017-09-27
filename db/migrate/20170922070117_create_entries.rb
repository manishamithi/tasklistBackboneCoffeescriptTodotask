class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.string :ename 
      t.string :starttime
      t.string :endtime
      t.boolean :complete

      t.timestamps
    end
  end
end
