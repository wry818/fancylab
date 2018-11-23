class CourseController < ApplicationController
  include ApplicationHelper
  before_filter :load_user
  
  layout 'course/layouts/application'
  
  def index
    
    @advertisement_images = AdvertisementImage.order(:id => :desc)
    
    if @current_user
    
      subquery = CoursesUser.select("courses_users.*").where(:user_id => @current_user.id)
      @courses = Course.joins("LEFT JOIN (#{subquery.to_sql}) sub ON courses.id = sub.course_id")
                .select("courses.*, sub.course_id")
                .order(:id => :desc)
              
      # Message.where(user_id: CoursesUser.select("user_id").where(:user_id => @current_user.id))
      #
      # @courses = Course.joins(CoursesUser.select("user_id").where(:user_id => @current_user.id))
                
      # @courses = Course.joins("LEFT JOIN courses_users ON courses.id = courses_users.course_id")
  #                 .where(:courses_users=>{:user_id => @current_user.id })
  #                 .select("courses.*, courses_users.course_id")
  #                 .order(:id => :desc)
        
    else
    
      @courses = Course.select("courses.*, null as course_id").order(:id => :desc)
    
    end
    
  end
  
  def all
    
    if @current_user
      
      subquery = CoursesUser.select("courses_users.*").where(:user_id => @current_user.id)
      @courses = Course.joins("LEFT JOIN (#{subquery.to_sql}) sub ON courses.id = sub.course_id")
                .select("courses.*, sub.course_id")
                .order(:id => :desc)
        
    else
    
      @courses = Course.select("courses.*, null as course_id").order(:id => :desc)
    
    end
    
  end
  
  def detail
    
    @bought = false
    @course = Course.friendly.find(params[:id])
    @sub_courses = @course.sub_courses.order(:created_at => :desc)
    
    if @current_user && @current_user.courses.where(:id => @course.id).exists?
      @bought = true
    end
    
    # order = Order.new
    # order.user_id = 2
    # order.out_trade_no = "1111"
    # order.status = Order::Uncompleted
    # order.save
    #
    # order_item = OrderItem.new
    # order_item.course_id = @course.id
    # order_item.base_amount = (2800 / 100).ceil
    # order_item.quantity = 1
    #
    # order.order_items << order_item
    
    # if !CoursesUser.where(:course_id => @course.id, :user_id => 2).exists?
    #   courses_user = CoursesUser.new
    #   courses_user.course_id = @course.id
    #   courses_user.user_id = 2
    #   courses_user.save
    # end
    
  end
  
  def imgtext_detail
    
    @bought = false
    @sub_course = SubCourse.friendly.find(params[:id])
    
    @course = @current_user.courses.friendly.find(params[:course_id]) rescue nil
    
    if @current_user && @course
      @bought = true
    end
    
  end
    
  def video_detail
    
    @bought = false
    @sub_course = SubCourse.friendly.find(params[:id])

    @course = @current_user.courses.friendly.find(params[:course_id]) rescue nil
    
    if @current_user && @course
      @bought = true
    end
    
  end
  
  private
  def load_user
    
    @is_wechat_browser = is_wechat_browser?
    @current_user = nil
    
    if session[:openid]
      
      @current_user = User.where(:openid => session[:openid]).first
    
      if !@current_user
        
        puts "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"
        
      end
    
    else
      
      # @current_user = User.order(:id => :desc).first
      # puts "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      # puts @current_user.id
      # session[:openid] = "o4FY5uCCwjbaPOjrZA0Oh-ay0MnM"
      # render :text => "error" and return
      
    end
        
  end
  
end
