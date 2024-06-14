class ReviewsController < ApplicationController
    before_action :set_course
    before_action :set_review, only: [:edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def new
      @review = @course.reviews.build
    end
  
    def create
      @review = @course.reviews.build(review_params)
      @review.user = current_user # Assuming you have user authentication
  
      if @review.save
        redirect_to @course, notice: 'Review was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @review.update(review_params)
        redirect_to @course, notice: 'Review was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @review.destroy
      redirect_to @course, notice: 'Review was successfully destroyed.'
    end
  
    private
  
    def set_course
      @course = Course.find(params[:course_id])
    end
  
    def set_review
      @review = @course.reviews.find(params[:id])
    end
  
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
  end
  