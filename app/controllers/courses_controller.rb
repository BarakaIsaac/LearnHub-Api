class CoursesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity


    def index
        courses = Course.all
        render json: courses
    end

    def show
        course = Course.find(params[:id])
        render json: course
    end

    def update
        course = Course.find(params[:id])
        course.update!(course_params)
        render json: course
    end

    def create
        course = Course.create!(course_params)
        render json: course
    end

    def destroy
        course = Course.find(params[:id])
        course.destroy
        head :no_content
    end

    private

    def render_unprocessable_entity(invalid)
        render json: {error: invalid.record.errors}, status: :unprocessable_entity
    end

    def course_params
        params.require(:course).permit(:title, :description, :instructor, :creator_id, :rating)
    end

    def record_not_found
        render json: { error: "Course not found" }, status: :not_found
    end
end
