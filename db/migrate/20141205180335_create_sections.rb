class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :page
      t.string 'name', limit: 80
      t.integer 'position'
      t.boolean 'visible', default: false
      t.string 'content_type', limit: 100
      t.text 'content'
    end
    add_index('sections', 'page_id')
  end
end
