class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :name
      t.text :description
      t.integer :status
      t.belongs_to :syllabus, index: true

      t.timestamps
    end
  end
end
