json.extract! grader, :id, :lname, :fname, :email, :created_at, :updated_at
json.url grader_url(grader, format: :json)
