class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :listname 
      t.string :startdate
      t.string :enddate
      t.boolean :complete

      t.timestamps
    end
  end
end
