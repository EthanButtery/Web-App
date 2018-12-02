class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.integer :semester_id
      t.string :course_name
      t.string :department
      t.string :instructor
      t.integer :credits
      t.string :grade
      t.integer :user_id


      t.timestamps
    end
  end
end
