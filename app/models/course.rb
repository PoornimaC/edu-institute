class Course < ActiveRecord::Base
	has_many :syllabuses, :dependent => :destroy
	validates :name, :duration_in_months, presence: true
	validates :duration_in_months, numericality: { only_integer: true, greater_than: 0}
end
