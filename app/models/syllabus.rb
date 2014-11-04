class Syllabus < ActiveRecord::Base
  belongs_to :course
  has_many :chapters, :dependent => :destroy
  validates :name, presence: true, uniqueness: {scope: :course_id, case_sensitive: false }
 end
