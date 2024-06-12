class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.string :technologies
      t.integer :duration
      t.text :table_of_contents
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
