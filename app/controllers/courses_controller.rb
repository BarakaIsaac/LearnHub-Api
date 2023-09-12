class CoursesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    before_action :authorized, except: [:index, :show]
    before_action :authorize_admin_or_teacher, only: [:create, :update, :destroy]

    def is_enrolled
        user = User.find(params[:user_id])
        course = Course.find(params[:course_id])
        is_enrolled = user.enrolled_in?(course)
    
        render json: { isEnrolled: is_enrolled }
      end


      def index
        if current_user && current_user["role"].downcase == "teacher"
          # Show courses created by teachers or admins
          courses = Course.where(creator_id: current_user.id)
        else
          # Show all courses for students or when there is no current user
          courses = Course.all
        end
          render json: courses, methods: :image_url, status: :ok
         
      end

    def show
        course = Course.find(params[:id])
        render json: course, status: :ok
    end

    def update
        course = Course.find(params[:id])
        course.update!(course_params)
        render json: course, status: :ok
    end

    def create
        # course = Course.new(course_params)
        course = current_user.created_courses.build(course_params)

        course.rating ||= 0
        course.instructor ||= current_user.username

        if course.save
          render json: course, status: :created, serializer: CourseSerializer
        else
          render json: { errors: course.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        course = Course.find(params[:id])
        course.destroy
        head :no_content
    end

    def enroll
        course = Course.find(params[:id])
        
        if current_user.enrolled_in?(course)
          render json: { error: 'Already enrolled in this course' }, status: :unprocessable_entity
        else
          current_user.enroll_in(course)
          render json: { message: 'Enrolled successfully' }, status: :ok
        end
      end
  
      # Unenroll user from a course
      def unenroll
        course = Course.find(params[:id])
        
        if current_user.enrolled_in?(course)
          current_user.unenroll_from(course)
          render json: { message: 'Unenrolled successfully' }, status: :ok
        else
          render json: { error: 'Not enrolled in this course' }, status: :unprocessable_entity
        end
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
