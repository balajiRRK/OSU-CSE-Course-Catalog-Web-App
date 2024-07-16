json.extract! api_search, :id, :search, :term, :campus, :academic_career, :catalog_number, :catalog_level, :component, :subject, :instruction_mode, :evening, :course_id, :created_at, :updated_at
json.url api_search_url(api_search, format: :json)
