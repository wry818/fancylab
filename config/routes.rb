FancyLab::Application.routes.draw do
  
  mount WeixinRailsMiddleware::Engine, at: "/"

    root 'fancy#index'
    
    # Course
    scope 'course' do
      root 'course#index', as: :course_index
      get 'all', to: 'course#all', as: :course_all
      get 'detail/:id', to: 'course#detail', as: :course_detail
      get 'imgtext_detail/:course_id/:id', to: 'course#imgtext_detail', as: :imgtext_detail
      get 'video_detail/:course_id/:id', to: 'course#video_detail', as: :video_detail
    end

    get 'fancylab/videolike/:id', to: 'fancy#video_like', as: :fancy_videolike
    get 'fancylab/weishop', to: 'fancy#wei_shop', as: :fancy_weishop
    get 'fancylab/lottery', to: 'fancy#lottery', as: :fancy_lottery
    match 'fancylab/vop' => 'fancy#vop', via: [:post, :patch]

    #weixin pay
    post 'ajax/weixin_payment_req', to: 'weixin#ajax_payment_req', as: :weixin_ajax_payment_req
    post 'ajax/weixin_native_payment_req', to: 'weixin#ajax_native_payment_req', as: :weixin_ajax_native_payment_req
    post 'weixin_notify', to: 'weixin#notify', as: :weixin_notify
    
    # if !Rails.env.production?
    # get '404', :to => 'application#page_not_found'
    # get '500', :to => 'application#page_not_found'
    # end
    # make sure this rule is the last one
    #  get '*path' => proc { |env| Rails.env.development? ? (raise ActionController::RoutingError, %{No route matches "#{env["PATH_INFO"]}"}) : ApplicationController.action(:render_not_found).call(env) }
    # get '*unmatched_route', :to => 'application#raise_not_found!'
    
    match '*path' => proc { |env| ApplicationController.action(:page_not_found).call(env) },via: [:get]
    
end

