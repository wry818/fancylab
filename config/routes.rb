FancyLab::Application.routes.draw do
  
  mount WeixinRailsMiddleware::Engine, at: "/"

    root 'fancy#index'
    
    # Course
    scope 'course' do
      root 'course#index', as: :course_index
    end

    get 'fancylab/videolike/:id', to: 'fancy#video_like', as: :fancy_videolike
    get 'fancylab/weishop', to: 'fancy#wei_shop', as: :fancy_weishop
    get 'fancylab/lottery', to: 'fancy#lottery', as: :fancy_lottery
    match 'fancylab/vop' => 'fancy#vop', via: [:post, :patch]
    
    
    # if !Rails.env.production?
    # get '404', :to => 'application#page_not_found'
    # get '500', :to => 'application#page_not_found'
    # end
    # make sure this rule is the last one
    #  get '*path' => proc { |env| Rails.env.development? ? (raise ActionController::RoutingError, %{No route matches "#{env["PATH_INFO"]}"}) : ApplicationController.action(:render_not_found).call(env) }
    # get '*unmatched_route', :to => 'application#raise_not_found!'

    match '*path' => proc { |env| ApplicationController.action(:page_not_found).call(env) },via: [:get]
    
end

