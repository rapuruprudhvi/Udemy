json.extract! course, :id, :title, :description, :technologies, :duration, :table_of_contents, :user_id, :created_at, :updated_at
json.url course_url(course, format: :json)
