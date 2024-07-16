json.extract! instructor, :id, :lname, :fname, :email, :created_at, :updated_at
json.url instructor_url(instructor, format: :json)
