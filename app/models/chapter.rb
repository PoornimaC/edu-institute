class Chapter < ActiveRecord::Base
  belongs_to :syllabus
  validates :name, presence: true, uniqueness: {scope: :syllabus_id, case_sensitive: false }
end
