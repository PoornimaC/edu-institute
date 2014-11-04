json.array!(@courses) do |course|
  json.extract! course, :id, :name, :description, :status, :duration_in_months
  json.url course_url(course, format: :json)
end
