class LessonsController < ApplicationController

  def create
    lesson = Lesson.new(lesson_params)

    if lesson.save
      render json: lesson, status: :created
    else
      render json: { errors: lesson.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  def index
    lessons = Lesson.all
    render json: lessons, status: :ok
  end

  def show
    lesson = Lesson.find(params[:id])
    render json: lesson, status: :ok
  end

  def update
    lesson = Lesson.find(params[:id])

    if lesson.update!(lesson_params)
      render json: lesson, status: :ok
    else
      render json: { errors: lesson.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  def destroy
    lesson = Lesson.find(params[:id])
    lesson.destroy
    head :no_content
  end
end
