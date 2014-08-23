class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :td
      t.datetime :start
      t.datetime :stop

      t.timestamps
    end
  end
end