class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :courses, :couse_name, :course_name
  end
end
