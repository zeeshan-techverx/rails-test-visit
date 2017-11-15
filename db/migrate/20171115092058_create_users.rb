class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string 		:name, null: false, default: ""
      t.integer 	:number
      t.text   		:description, null: false, default: ""
      t.date     	:date
      t.timestamps
    end
    add_index :users, :name
    add_index :users, :number
    add_index :users, [:name, :number], unique: true
  end
end
