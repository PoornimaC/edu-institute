class CreateSyllabuses < ActiveRecord::Migration
  def change
    create_table :syllabuses do |t|
      t.string :name
      t.text :description
      t.integer :status
      t.belongs_to :course, index: true

      t.timestamps
    end
  end
end
