class CourseController < ApplicationController
  include ApplicationHelper

  layout 'course/layouts/application'
  
  def index
    
    @courses = Course.order(:id => :desc)
    @advertisement_images = AdvertisementImage.order(:id => :desc)
    
  end
  
  def detail
    
    @course = Course.friendly.find(params[:id])
    @sub_courses = @course.sub_courses.order(:created_at => :desc)
    
  end
  
  def imgtext_detail
    
    @sub_course = SubCourse.friendly.find(params[:id])
    
  end
    
  def video_detail
    
    @sub_course = SubCourse.friendly.find(params[:id])
    
  end
  
end
