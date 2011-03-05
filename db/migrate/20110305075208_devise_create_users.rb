class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.string :name
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    
    add_column :task_items, :user_id, :integer
  end

  def self.down
    drop_table :users
    remove_column :task_items, :user_id
  end
end
