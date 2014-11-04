class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.text :description
      t.integer :status, null: false, default: EduInsConstants::ACTIVE
      t.integer :duration_in_months

      t.timestamps
    end
  end
end
