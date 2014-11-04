require 'time'
class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :assign_default_role

  def self.display_formatted_date(date)
    return "" if date.blank?
    res = date.strftime(EduInsConstants::DATE_TIME_FORMAT)
    res
  end

  private

  def assign_default_role
    add_role(:student) if self.roles.blank?
  end
end
