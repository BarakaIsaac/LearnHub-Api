class EnrollmentsController < ApplicationController
    def create
      @enrollment = Enrollment.new(enrollment_params)
  
      if @enrollment.save
        render json: @enrollment, status: :created
      else
        render json: @enrollment.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def enrollment_params
      params.require(:enrollment).permit(:student_name, :course_name)
    end
  end
  