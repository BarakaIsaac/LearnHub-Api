class EnrollmentsController < ApplicationController
  before_action :authenticate_user!
  ##
  def create
    course = Course.find(params[:course_id])
    enrollment = Enrollment.new(course: course, student: current_user)

    if enrollment.save
      render json: enrollment, status: :created
    else
      render json: { errors: enrollment.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  def index
    enrollments = current_user.enrollments
    render json: enrollments, each_serializer: EnrollmentSerializer, status: :ok
  end
end
