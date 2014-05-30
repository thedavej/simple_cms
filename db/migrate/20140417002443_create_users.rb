class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.column "first_name", :string, :limit => 25
      # Below is the shorthand version for the add column command.
      t.string "last_name", :limit => 50
      t.string "email", :default => "", :null => false
      t.string "password", :limit => 25
      
      # t.datetime "created at"
      # t.datetime "updated_at"
      # These last two commands have a Rails shortcut, t.timestamps!
      t.timestamps
    end
  end

  def down
  	drop_table :users
  end
end
