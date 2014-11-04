json.array!(@syllabuses) do |syllabus|
  json.extract! syllabus, :id, :name, :description, :status, :course_id
  json.url syllabus_url(syllabus, format: :json)
end
