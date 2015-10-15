class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :courses, dependent: :destroy
  has_many :enrollments, dependent: :destroy
  has_many :enrolled_courses, :through => :enrollments, :source => :course

  def enrolled_in?(course)
    return enrolled_courses.include?(course)
  end
end
