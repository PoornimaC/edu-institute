crumb :root do
  link "Home", root_path
end

 #Courses

crumb :courses do
  link "Courses", courses_path
  parent :root
end

crumb :course_new do |u|
  link "New", new_course_path
  parent :courses
end

crumb :course do |u|
  link "#{u.name}", course_path(u)
  parent :courses
end

crumb :course_edit do |u|
link "Edit: #{u.name}", edit_course_path(u)
parent :courses
end
 
#Syllabus

crumb :syllabuses do |s|
  link "Syllabus", course_syllabuses_path(s)
  parent :course, s
end

crumb :syllabus_new do |u|
  link "New", new_course_syllabus_path(u)
  parent :syllabuses, u
end
  
crumb :syllabus do |s|
  link s.name, course_syllabus_path(s.course, s)
  parent :syllabuses, s.course
end

crumb :syllabus_edit do |u|
  link "Edit: #{u.name}", edit_course_syllabus_path(u.course, u)
  parent :syllabuses, u.course
end

#Chapters

crumb :chapters do |s|
  course = s.course
  link "Chapters", course_syllabus_chapters_path(course, s)
  parent :syllabus, s
end

crumb :chapter_new do |u|
  course = u.course
  link "New", new_course_syllabus_chapter_path(course, u)
  parent :chapters, u
end
  
crumb :chapter do |s|
  syllabus = s.syllabus
  course = syllabus.course
  link s.name, course_syllabus_chapter_path(course, syllabus, s)
  parent :chapters, syllabus
end

crumb :chapter_edit do |s|
  syllabus = s.syllabus
  course = syllabus.course
  link "Edit: #{s.name}", edit_course_syllabus_chapter_path(course, syllabus, s)
  parent :chapters, syllabus
end


# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).