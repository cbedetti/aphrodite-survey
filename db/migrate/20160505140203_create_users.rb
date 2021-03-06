class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :firstname
      t.string :email
      t.integer :age
      t.string :gender
      t.string :quebeker
      t.integer :yearsquebec
      t.string :mothertongue
      t.string :languages
      t.integer :education
      t.string :highestscol
      t.string :question1
      t.string :question2
      t.string :neurotb
      t.string :psytb
      t.string :medoc

      t.integer :student_group_id
      t.datetime :end_of_session
      t.datetime :start
      t.datetime :stop

      t.string :session_token

      t.timestamps
    end
  end
end
