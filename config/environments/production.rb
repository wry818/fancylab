FancyLab::Application.configure do
    # Settings specified here will take precedence over those in config/application.rb.

    config.facebook_app_id = ENV['FACEBOOK_APP_ID_PROD']
    config.facebook_app_secret = ENV['FACEBOOK_APP_SECRET_PROD']
    config.twitter_app_id = ENV['TWITTER_APP_ID']
    config.twitter_app_secret = ENV['TWITTER_APP_SECRET']

    config.braintree_client_side_encyption_key = ENV['BRAINTREE_CLIENT_SIDE_ENCRYPTION_KEY_PROD']
    config.braintree_default_merchant_account_id = ENV['BRAINTREE_CLIENT_SIDE_ENCRYPTION_KEY_PROD']
    
    config.stripe_api_key = ENV['STRIPE_API_KEY']
    config.stripe_public_key = ENV['STRIPE_PUBLIC_KEY']

    # Code is not reloaded between requests.
    config.cache_classes = true

    # Eager load code on boot. This eager loads most of Rails and
    # your application in memory, allowing both thread web servers
    # and those relying on copy on write to perform better.
    # Rake tasks automatically ignore this option for performance.
    config.eager_load = true

    # Full error reports are disabled and caching is turned on.
    config.consider_all_requests_local       = false
    config.action_controller.perform_caching = true

    # Enable Rack::Cache to put a simple HTTP cache in front of your application
    # Add `rack-cache` to your Gemfile before enabling this.
    # For large-scale production use, consider using a caching reverse proxy like nginx, varnish or squid.
    # config.action_dispatch.rack_cache = true

    # Disable Rails's static asset server (Apache or nginx will already do this).
    config.serve_static_assets = false

    # Compress JavaScripts and CSS.
    config.assets.js_compressor = :uglifier
    # config.assets.css_compressor = :sass

    # Do not fallback to assets pipeline if a precompiled asset is missed.
    config.assets.compile = false

    # Generate digests for assets URLs.
    config.assets.digest = true

    # Version of your assets, change this if you want to expire all your assets.
    config.assets.version = '1.0'

    # Specifies the header that your server uses for sending files.
    # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
    # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

    # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
    config.force_ssl = false

    # Set to :debug to see everything in the log.
    config.log_level = :info

    # Prepend all log lines with the following tags.
    # config.log_tags = [ :subdomain, :uuid ]

    # Use a different logger for distributed setups.
    # config.logger = Logger.new(STDOUT)

    # Use a different cache store in production.
    # config.cache_store = :mem_cache_store

    # Enable serving of images, stylesheets, and JavaScripts from an asset server.
    # config.action_controller.asset_host = "https://#{ENV['AWS_BUCKET']}.s3.amazonaws.com"   <---- SET THIS TO CLOUDFLARE OR CLOUDFRONT PATH

    # Precompile additional assets.
    # application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
    config.assets.precompile += %w( .gif bx_loader.gif controls.png )
    config.assets.precompile += %w( application_weixin.js application_weixin.css application_web.js)
    # Ignore bad email addresses and do not raise email delivery errors.
    # Set this to true and configure the email server for immediate delivery to raise delivery errors.
    # config.action_mailer.raise_delivery_errors = false

    # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
    # the I18n.default_locale when a translation can not be found).
    config.i18n.fallbacks = true

    # Send deprecation notices to registered listeners.
    config.active_support.deprecation = :notify

    # Disable automatic flushing of the log to improve performance.
    # config.autoflush_log = false

    # Use default logging formatter so that PID and timestamp are not suppressed.
    config.log_formatter = ::Logger::Formatter.new
    
    # show error page set
    config.error_page_ishow=true
end
