#encoding: utf-8
class CourseController < ApplicationController
    
    layout 'course/layouts/application'
    
    def index
      
      @courses = Course.order(:id => :desc)
      @advertisement_images = AdvertisementImage.order(:id => :desc)
      
    end
    
end
