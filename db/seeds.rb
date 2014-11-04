# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:

user = User.new :name => "Professor", :email => 'professor@eduinstitution.com', :password => 'chakra123', :password_confirmation => 'chakra123', :contact_number => "1234567890"
user.confirmed_at = Time.now
user.save!
user.add_role "professor"

user1 = User.new :name => "Student", :email => 'student@eduinstitution.com', :password => 'chakra123', :password_confirmation => 'chakra123', :contact_number => "1234567890"
user1.confirmed_at = Time.now
user1.save!
user.add_role "student"


