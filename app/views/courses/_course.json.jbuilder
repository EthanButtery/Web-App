json.extract! course, :id, :semester_id, :couse_name, :department, :instructor, :credits, :grade, :created_at, :updated_at
json.url course_url(course, format: :json)
