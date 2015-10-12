class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_enrollment_for_lesson_show

  def show
  end

  private 

  helper_method :current_lesson

  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  def require_enrollment_for_lesson_show
    if not current_user.enrolled_in?(current_lesson.section.course)
      redirect_to course_path(current_lesson.section.course), :alert => 'You must be enrolled in the course to access the lessons'
    end
  end
end
