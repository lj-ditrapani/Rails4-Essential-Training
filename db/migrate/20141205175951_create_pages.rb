class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :subject
      t.string 'name', limit: 80
      t.integer 'permalink'
      t.integer 'position'
      t.boolean 'visible', default: false
      t.timestamps
    end
    add_index('pages', 'subject_id')
    add_index('pages', 'permalink')
  end
end
