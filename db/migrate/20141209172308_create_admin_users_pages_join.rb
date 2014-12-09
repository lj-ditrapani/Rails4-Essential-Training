class CreateAdminUsersPagesJoin < ActiveRecord::Migration
  def change
    # Don't create id, this is a join table
    create_table :admin_users_pages, id: false  do |t|
      t.references :admin_user
      t.references :page
      # t.integer 'admin_user_id'
      # t.integer 'page_id'
    end
    # Index across both columns
    add_index :admin_users_pages, ['admin_user_id', 'page_id']
  end
end
