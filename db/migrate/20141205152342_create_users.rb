class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      # auto-increment id is automatically added
      t.column 'first_name', :string, limit: 25
      t.string 'last_name', limit: 50
      t.string 'email', default: '', null: false
      t.string 'password', limit: 40
      # t.timestamps auto adds create_at and updated_at columns
      # t.datetime 'create_at'
      # t.datetime 'updated_at'
      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
