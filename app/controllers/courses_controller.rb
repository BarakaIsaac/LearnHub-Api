class CoursesController < ApplicationController

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
        courrse.update(course_params)
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

    
end
