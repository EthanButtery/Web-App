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
<<<<<<< HEAD

=======
>>>>>>> 677d6a6a6cf79ee7739e55c81d768f6f581e1513
      t.timestamps
    end
  end
end
